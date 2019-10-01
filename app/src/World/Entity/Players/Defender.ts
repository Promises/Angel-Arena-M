import { AbstractPlayer } from './AbstractPlayer';
import { ALLOW_PLAYER_TOWER_LOCATIONS, PLAYER_AREAS, Point } from '../../GlobalSettings';
import { Race } from '../../Game/Races/Race';
import { Rectangle } from '../../../JassOverrides/Rectangle';
import { Trigger } from '../../../JassOverrides/Trigger';
import { WarcraftMaul } from '../../WarcraftMaul';
import { AbstractHologramMaze } from '../../Holograms/AbstractHologramMaze';
import { Tower } from '../Tower/Specs/Tower';
import { TimedEvent } from '../../../lib/WCEventQueue/TimedEvent';
import { Log } from '../../../lib/Serilog/Serilog';

export class Defender extends AbstractPlayer {
    public chimeraCount: number = 0;
    public zerglings: number = 0;
    // private towerKeys: IterableIterator<number> | undefined = undefined;
    private loggedDebug: boolean = false;
    public seaElemetals: number = 0;
    public killHook?: () => void;
    public goldReward: number = 0;

    get towerForces(): Map<number, number> {
        return this._towerForces;
    }

    get builders(): unit[] {
        return this._builders;
    }

    set builders(value: unit[]) {
        this._builders = value;
    }

    private _voidFragments: number = 0;
    private _voidFragmentTick: number = 0;


    private _scoreSlot: number = 0;
    private _kills: number = 0;
    public allowPlayerTower: unit | undefined;
    private _hasHybridRandomed: boolean = false;
    private _hasHardcoreRandomed: boolean = false;
    private _hasNormalPicked: boolean = false;
    private _races: Race[] = [];
    private _totalMazeLength: number = 0;
    private towersEnabled: boolean = true;

    private _repickCounter: number = 0;
    private _voidBuilder: unit | undefined;
    private _lootBoxer: unit | undefined;
    private _hybridBuilder: unit | undefined;
    private _hybridTowers: any[] = [];
    private leaveTrigger: Trigger;
    private selectUnitTrigger: Trigger;
    private deniedPlayers: Map<number, boolean> = new Map<number, boolean>();
    // private _towers: Map<number, Tower> = new Map<number, Tower>();
    private _towersArray: Tower[] = [];
    private holoMaze: AbstractHologramMaze | undefined = undefined;
    private game: WarcraftMaul;
    private _builders: unit[] = [];

    private _towerForces: Map<number, number> = new Map<number, number>();

    private protectedTowers: number[] = [ // towers that cant be disabled
        FourCC('n01D'), // [High Elven Farm] - High Elven Farm
        FourCC('n01E'), // [High Elven Farm] - Hungry Sheep
        FourCC('n01F'), // [High Elven Farm] - Hungry Albatross
        FourCC('n01G'), // [High Elven Farm] - Hungry Seal
        FourCC('n01I'), // [High Elven Farm] - Hungry Crab
        FourCC('n009'), // [Corrupt N.Elves] - Corrupted Moon Well
    ];


    constructor(id: number, game: WarcraftMaul) {
        super(id);
        this.game = game;
        this.setUpPlayerVariables();
        this.leaveTrigger = new Trigger();
        this.leaveTrigger.RegisterPlayerEventLeave(this);
        this.leaveTrigger.AddCondition(() => this.PlayerLeftTheGameConditions(game));
        this.leaveTrigger.AddAction(() => this.PlayerLeftTheGame());

        this.selectUnitTrigger = new Trigger();
        this.selectUnitTrigger.RegisterPlayerUnitEvent(this.wcPlayer, EVENT_PLAYER_UNIT_SELECTED);
        this.selectUnitTrigger.AddAction(() => this.SelectUnit());


        this.game.gameCommandHandler.commandTrigger.RegisterPlayerChatEvent(this.wcPlayer, '', false);
    }

    public setHoloMaze(holoMaze: AbstractHologramMaze | undefined): void {
        if (this.holoMaze !== undefined) {
            this.holoMaze.Destroy();
        }

        this.holoMaze = holoMaze;
    }

    private setUpPlayerVariables(): void {
        // Remove fog
        CreateFogModifierRectBJ(true, this.wcPlayer, FOG_OF_WAR_VISIBLE, GetPlayableMapRect());


        // Set Starting gold and lumber
        SetPlayerStateBJ(this.wcPlayer, PLAYER_STATE_RESOURCE_GOLD, this.id === COLOUR.GRAY ? 150 : 100);
        SetPlayerStateBJ(this.wcPlayer, PLAYER_STATE_RESOURCE_LUMBER, 1);


        // Creat the allow player indicator tower
        const allowTowerLoc: Point = ALLOW_PLAYER_TOWER_LOCATIONS[this.id];
        //
        this.allowPlayerTower = CreateUnit(this.wcPlayer, FourCC('h03S'), allowTowerLoc.x, allowTowerLoc.y, 0.000);
        SetUnitVertexColor(this.allowPlayerTower, 0, 255, 0, 255);

    }

    public hasRace(race: Race): boolean {
        return this._races.indexOf(race) !== -1;
    }


    public getArea(): Rectangle {
        return PLAYER_AREAS[this.id];
    }

    public getCenterX(): number {
        const x1: number = this.getArea().minX;
        const x2: number = this.getArea().maxX;

        return (x1 + x2) / 2;
    }

    public getCenterY(): number {
        const y1: number = this.getArea().minY;
        const y2: number = this.getArea().maxY;

        return (y1 + y2) / 2;
    }

    public getVoidBuilder(): unit | undefined {
        return this._voidBuilder;
    }

    public getLootBoxer(): unit | undefined {
        return this._lootBoxer;
    }


    public getRectangle(): Rectangle {
        return this.getArea();
    }

    private PlayerLeftTheGameConditions(game: WarcraftMaul): boolean {
        if (game.gameLives > 0) {
            return true;
        }
        SendMessage(`${this.getNameWithColour()} has left the game!`);
        return false;
    }

    public PlayerLeftTheGame(): void {

        SendMessage(`${this.getNameWithColour()} has left the game!`);

        // TriggerSleepAction(2.00);
        this.game.worldMap.playerSpawns[this.id].isOpen = false;
        if (this.game.scoreBoard && this._scoreSlot > -1) {

            MultiboardSetItemValueBJ(
                this.game.scoreBoard.board, 1, 7 + this._scoreSlot,
                Util.ColourString(this.getColourCode(), '<Quit>'));
            this._scoreSlot = -1;
        }
        for (const builder of this.builders) {
            RemoveUnit(builder);
        }

        if (this.hybridBuilder) {
            RemoveUnit(this.hybridBuilder);
        }
        const leaveFunction: TimedEvent = new TimedEvent(() => this.AfterPlayerLeft(), 20);
        this.game.timedEventQueue.AddEvent(leaveFunction);

    }

    private AfterPlayerLeft(): boolean {
        this.game.safeEventQueue.AddMed(() => this.DistributeAndDestroyTowers());
        this.setHoloMaze(undefined);
        return true;
    }


    public AddTower(tower: Tower): void {
        this._towersArray.push(tower);
    }

    public GiveKillCount(): void {
        this._kills++;
        if (this.game.scoreBoard) {
            MultiboardSetItemValueBJ(this.game.scoreBoard.board, 2, 7 + this._scoreSlot, `${this._kills}`);
        }
        if (this.killHook) {
            this.killHook();
        }
    }

    /**
     * Getters and Setters
     */
    get totalMazeLength(): number {
        return this._totalMazeLength;
    }

    set totalMazeLength(value: number) {
        this._totalMazeLength = value;
    }

    public GetTower(id: number): Tower | undefined {
        const indx: number = this._towersArray.findIndex((element) => element.UniqueID === id);
        if (indx >= 0) {
            return this._towersArray[indx];
        }
        return undefined;
    }

    get hybridTowers(): string[] {
        return this._hybridTowers;
    }

    set hybridTowers(value: string[]) {
        this._hybridTowers = value;
    }

    get hasHardcoreRandomed(): boolean {
        return this._hasHardcoreRandomed;
    }

    set hasHardcoreRandomed(value: boolean) {
        this._hasHardcoreRandomed = value;
    }

    get hasNormalPicked(): boolean {
        return this._hasNormalPicked;
    }

    set hasNormalPicked(value: boolean) {
        this._hasNormalPicked = value;
    }

    get races(): Race[] {
        return this._races;
    }

    get towersArray(): Tower[] {
        return this._towersArray;
    }

    set races(value: Race[]) {
        this._races = value;
    }

    get hybridBuilder(): unit | undefined {
        return this._hybridBuilder;
    }

    set hybridBuilder(value: unit | undefined) {
        this._hybridBuilder = value;
    }

    get hasHybridRandomed(): boolean {
        return this._hasHybridRandomed;
    }

    set hasHybridRandomed(value: boolean) {
        this._hasHybridRandomed = value;
    }

    get lootBoxer(): unit | undefined {
        return this._lootBoxer;
    }

    set lootBoxer(value: unit | undefined) {
        this._lootBoxer = value;
    }

    get voidBuilder(): unit | undefined {
        return this._voidBuilder;
    }

    set voidBuilder(value: unit | undefined) {
        this._voidBuilder = value;
    }

    get repickCounter(): number {
        return this._repickCounter;
    }

    set repickCounter(value: number) {
        this._repickCounter = value;
    }

    get kills(): number {
        return this._kills;
    }

    set kills(value: number) {
        this._kills = value;
    }

    get scoreSlot(): number {
        return this._scoreSlot;
    }

    set scoreSlot(value: number) {
        this._scoreSlot = value;
    }

    private DistributePlayerGold(): void {
        const leavingPlayerGold: number = this.getGold();
        let goldDistribution: number = leavingPlayerGold / (this.game.players.size - 1);

        goldDistribution = Math.floor(goldDistribution * 0.3);

        for (const player of this.game.players.values()) {
            player.sendMessage(`You have received |cffffcc00${goldDistribution}|r gold from the leaving player!`);
            player.giveGold(goldDistribution);
        }
    }


    private DistributeAndDestroyTowers(): boolean {
        if (this._towersArray.length > 0) {
            const tower: Tower | undefined = this._towersArray[0];
            if (tower) {
                this.game.sellTower.SellTower(tower.tower);
                return false;
            }

        }

        this.DistributePlayerGold();
        this.setGold(0);
        this.game.players.delete(this.id);

        return true;

    }

    public ClaimTowers(): void {
        const rectangle: rect = this.getRectangle().toRect();
        const grp: group = GetUnitsInRectMatching(rectangle, Condition(() => this.IsOwnerNotMe()));
        ForGroupBJ(grp, () => this.ClaimTower());
        RemoveRect(rectangle);
        DestroyGroup(grp);
    }


    private ClaimTower(): void {
        if (IsUnitType(GetEnumUnit(), UNIT_TYPE_STRUCTURE)) {
            const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(GetEnumUnit())));
            if (owner) {
                const tower: Tower | undefined = owner.GetTower(GetHandleIdBJ(GetEnumUnit()));
                if (tower) {
                    tower.Sell();
                    tower.SetOwnership(this);
                }
            }
        } else if (!IsUnitType(GetEnumUnit(), UNIT_TYPE_SUMMONED)) {
            const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(GetEnumUnit())));
            if (owner && owner !== this) {
                SetUnitPosition(GetEnumUnit(), owner.getCenterX(), owner.getCenterY());
            }
        }
    }


    public DisableTowers(): void {
        this.towersEnabled = !this.towersEnabled;

        this.towersArray.forEach((tower) => {
            if (tower.GetSellValue() <= 10 && !(this.protectedTowers.indexOf(tower.GetTypeID()) >= 0)) {
                if (this.towersEnabled) {
                    PauseUnitBJ(false, tower.tower);
                } else {
                    PauseUnitBJ(true, tower.tower);
                }
            }
        });

        if (this.towersEnabled) {
            this.sendMessage('Towers enabled');
        } else {
            this.sendMessage('Towers disabled');
        }

    }

    public GetVoidFragments(): number {
        return this._voidFragments;
    }

    public GetVoidFragmentTick(): number {
        return this._voidFragmentTick;
    }

    public SetVoidFragments(value: number): void {
        this._voidFragments = value;
    }

    public SetVoidFragmentTick(value: number): void {
        this._voidFragmentTick = value;
    }

    public HasDenied(num: number): boolean {
        return !!this.deniedPlayers.get(num);
    }

    private ReRenderAllowPlayersTower(): void {


        let red: number = 0;
        let green: number = 255;
        const allowTower: unit | undefined = this.allowPlayerTower;
        if (allowTower) {
            this.deniedPlayers.forEach((value: boolean, key: number) => {
                if (value) {
                    if (GetLocalPlayer() === Player(key)) { // ASK BEFORE EVER USING GetLocalPlayer()
                        red = 255;
                        green = 0;
                    }
                }
            });
            SetUnitVertexColor(allowTower, red, green, 0, 255);

        }
    }

    public DenyAllPlayers(): void {
        this.game.players.forEach((player) => {
            if (this.id !== player.id) {
                this.deniedPlayers.set(player.id, true);
            }
        });
        this.ReRenderAllowPlayersTower();
    }

    public DenyPlayer(num: number): void {
        this.deniedPlayers.set(num, true);
        this.ReRenderAllowPlayersTower();

    }

    public AllowAllPlayers(): void {
        this.game.players.forEach((player) => {
            if (this.id !== player.id) {
                this.deniedPlayers.set(player.id, false);
            }
        });
        this.ReRenderAllowPlayersTower();

        // this.deniedPlayers.set(num, false);
    }

    public AllowPlayer(num: number): void {
        this.deniedPlayers.set(num, false);
        this.ReRenderAllowPlayersTower();

    }

    private DestroyLeftoverUnits(): void {
        if (GetOwningPlayer(GetEnumUnit()) === GetTriggerPlayer()) {
            RemoveUnit(GetEnumUnit());

        }
    }

    public GetLogStr(): string {
        return `{"colour":${this.id}, "name": "${this.getPlayerName()}"}`;
    }

    private IsOwnerNotMe(): boolean {
        return GetOwningPlayer(GetFilterUnit()) !== this.wcPlayer;

    }

    public RemoveTower(handleId: number): void {
        this._towersArray = this._towersArray.filter((elem) => elem.UniqueID !== handleId);
    }

    private SelectUnit(): void {
        if (GetOwningPlayer(GetTriggerUnit()) === this.wcPlayer) {
            PauseUnit(GetTriggerUnit(), false);
        }
    }
}
