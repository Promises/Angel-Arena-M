import { WarcraftMaul } from '../../WarcraftMaul';
import { Defender } from '../Players/Defender';
import { TimedEvent } from '../../../lib/WCEventQueue/TimedEvent';
import { CheckPoint } from '../CheckPoint';
import { HologramCheckpointDistance } from '../../Holograms/HologramCheckpointDistance';
import { Log } from '../../../lib/Serilog/Serilog';

export class DummyPlayer {
    private game: WarcraftMaul;
    private player: Defender | undefined;
    private step: number = 0;
    private slot: number;
    private towers: number[] = [
        // FourCC('o00X'),
        // FourCC('hC86'),
        // FourCC('n00L'),
        // FourCC('n01C'),
        // FourCC('n018'),

        // FourCC('n01B'),
        // FourCC('oC26'),
        // FourCC('hC97'),
        // FourCC('n02X'),
        // FourCC('h02G'),
        // FourCC('u029'),
        // FourCC('u027'),
        // FourCC('u026'),
        // FourCC('u022'),
        FourCC('h00L'),
        FourCC('h02V'),
        FourCC('o012'),
        FourCC('o006'),
        FourCC('o013'),
        FourCC('o008'),


    ];

    private currentIndx: number = 0;

    constructor(game: WarcraftMaul, slot: number) {
        this.game = game;
        this.slot = slot;
        this.Setup();
    }

    private Setup(): boolean {
        const dummyPlayer: Defender = new Defender(this.slot, this.game);
        this.player = dummyPlayer;
        this.game.players.set(this.slot, dummyPlayer);
        // this.game.racePicking.PickRaceForPlayerByItem(dummyPlayer, FourCC('I00V'));
        // this.game.racePicking.PickRaceForPlayerByItem(dummyPlayer, FourCC('I00V'));
        // this.game.racePicking.PickRaceForPlayerByItem(dummyPlayer, FourCC('I00V'));
        // this.game.racePicking.PickRaceForPlayerByItem(dummyPlayer, FourCC('I00V'));
        this.game.worldMap.playerSpawns[this.slot].isOpen = true;
        this.game.timedEventQueue.AddEvent(new TimedEvent(() => this.ConstructTowers(), 10, false));
        this.step = 0;

        return true;
    }

    private ConstructTowers(): boolean {
        if (this.CreateTowersForPlayer()) {
            this.game.timedEventQueue.AddEvent(new TimedEvent(() => this.Leave(), 150, false));
            return true;
        }
        return false;
    }

    private Leave(): boolean {
        if (!this.player) {
            this.Setup();
            return false;
        }
        this.player.PlayerLeftTheGame();
        this.game.timedEventQueue.AddEvent(new TimedEvent(() => this.Setup(), 150, true));

        return true;

    }

    private GetTower(): number {
        this.currentIndx++;
        if (this.currentIndx === this.game.worldMap.towerConstruction.towerTypes.GetArray().length) {
            this.currentIndx = 0;
        }
        return this.game.worldMap.towerConstruction.towerTypes.GetArray()[this.currentIndx];
        // return this.towers[this.currentIndx];
        // return FourCC('h00L');
    }

    private CreateTowersForPlayer(): boolean {
        if (!this.player) {
            return true;
        }
        const firstSpawn: CheckPoint | undefined = this.game.worldMap.playerSpawns[this.player.id].spawnOne;
        if (firstSpawn === undefined) {
            return true;
        }

        const firstCheckpoint: CheckPoint | undefined = firstSpawn.next;
        if (firstCheckpoint === undefined) {
            return true;
        }

        const secondCheckpoint: CheckPoint | undefined = firstCheckpoint.next;
        if (secondCheckpoint === undefined) {
            return true;
        }

        const firstCheckpointX: number = GetRectCenterX(firstCheckpoint.rectangle);
        const firstCheckpointY: number = GetRectCenterY(firstCheckpoint.rectangle);
        const secondCheckpointX: number = GetRectCenterX(secondCheckpoint.rectangle);
        const secondCheckpointY: number = GetRectCenterY(secondCheckpoint.rectangle);
        const dist: HologramCheckpointDistance = new HologramCheckpointDistance(
            secondCheckpointX - firstCheckpointX,
            secondCheckpointY - firstCheckpointY);
        this.step++;
        if (this.step === 1) {
            this.game.worldMap.towerConstruction.SetupTower(CreateUnit(this.player.wcPlayer, this.GetTower(),
                firstCheckpointX + dist.yDividedBy9,
                firstCheckpointY + dist.xDividedBy9, bj_UNIT_FACING), this.player);
            return false;
        }
        if (this.step === 2) {
            this.game.worldMap.towerConstruction.SetupTower(CreateUnit(this.player.wcPlayer, this.GetTower(),
                firstCheckpointX + dist.xDividedBy9,
                firstCheckpointY + dist.yDividedBy9, bj_UNIT_FACING), this.player);
            return false;
        }
        if (this.step === 3) {
            this.game.worldMap.towerConstruction.SetupTower(CreateUnit(this.player.wcPlayer, this.GetTower(),
                firstCheckpointX - dist.yDividedBy9,
                firstCheckpointY - dist.xDividedBy9, bj_UNIT_FACING), this.player);
            return false;
        }
        if (this.step === 4) {
            this.game.worldMap.towerConstruction.SetupTower(CreateUnit(this.player.wcPlayer, this.GetTower(),
                firstCheckpointX - dist.xDividedBy9 - dist.yDividedBy18,
                firstCheckpointY - dist.yDividedBy9 - dist.xDividedBy18, bj_UNIT_FACING), this.player);
            return false;
        }
        if (this.step === 5) {
            this.game.worldMap.towerConstruction.SetupTower(CreateUnit(this.player.wcPlayer, this.GetTower(),
                firstCheckpointX - dist.xDividedBy9 - dist.xDividedBy18 + dist.yDividedBy9 - dist.yDividedBy18,
                firstCheckpointY - dist.yDividedBy9 - dist.yDividedBy18 + dist.xDividedBy9 - dist.xDividedBy18, bj_UNIT_FACING), this.player);
            return false;
        }
        if (this.step === 6) {
            this.game.worldMap.towerConstruction.SetupTower(CreateUnit(this.player.wcPlayer, this.GetTower(),
                firstCheckpointX - dist.xDividedBy9 - dist.xDividedBy18 + 2 * dist.yDividedBy9 - dist.yDividedBy18,
                firstCheckpointY - dist.yDividedBy9 - dist.yDividedBy18 + 2 * dist.xDividedBy9 - dist.xDividedBy18, bj_UNIT_FACING), this.player);
            return false;
        }
        if (this.step === 7) {
            this.game.worldMap.towerConstruction.SetupTower(CreateUnit(this.player.wcPlayer, this.GetTower(),
                firstCheckpointX - dist.xDividedBy18 + 3 * dist.yDividedBy9 - dist.yDividedBy18,
                firstCheckpointY - dist.yDividedBy18 + 3 * dist.xDividedBy9 - dist.xDividedBy18, bj_UNIT_FACING), this.player);
            return false;
        }
        if (this.step === 8) {
            this.game.worldMap.towerConstruction.SetupTower(CreateUnit(this.player.wcPlayer, this.GetTower(),
                firstCheckpointX + dist.xDividedBy18 + 3 * dist.yDividedBy9 - dist.yDividedBy18,
                firstCheckpointY + dist.yDividedBy18 + 3 * dist.xDividedBy9 - dist.xDividedBy18, bj_UNIT_FACING), this.player);
            return false;
        }
        if (this.step === 9) {
            this.game.worldMap.towerConstruction.SetupTower(CreateUnit(this.player.wcPlayer, this.GetTower(),
                firstCheckpointX + dist.xDividedBy9 + dist.xDividedBy18 + 2 * dist.yDividedBy9 - dist.yDividedBy18,
                firstCheckpointY + dist.yDividedBy9 + dist.yDividedBy18 + 2 * dist.xDividedBy9 - dist.xDividedBy18, bj_UNIT_FACING), this.player);
            return false;
        }
        if (this.step === 10) {
            this.game.worldMap.towerConstruction.SetupTower(CreateUnit(this.player.wcPlayer, this.GetTower(),
                firstCheckpointX + 2 * dist.xDividedBy9 + dist.xDividedBy18 + dist.yDividedBy9 - dist.yDividedBy18,
                firstCheckpointY + 2 * dist.yDividedBy9 + dist.yDividedBy18 + dist.xDividedBy9 - dist.xDividedBy18, bj_UNIT_FACING), this.player);
            return false;
        }
        if (this.step === 11) {
            this.game.worldMap.towerConstruction.SetupTower(CreateUnit(this.player.wcPlayer, this.GetTower(),
                firstCheckpointX + 2 * dist.xDividedBy9 + dist.xDividedBy18 - dist.yDividedBy18,
                firstCheckpointY + 2 * dist.yDividedBy9 + dist.yDividedBy18 - dist.xDividedBy18, bj_UNIT_FACING), this.player);
            return false;
        }
        if (this.step === 12) {
            this.game.worldMap.towerConstruction.SetupTower(CreateUnit(this.player.wcPlayer, this.GetTower(),
                firstCheckpointX + dist.xDividedBy9 + dist.xDividedBy18 - dist.yDividedBy9 - dist.yDividedBy18,
                firstCheckpointY + dist.yDividedBy9 + dist.yDividedBy18 - dist.xDividedBy9 - dist.xDividedBy18, bj_UNIT_FACING), this.player);
            return false;
        }
        if (this.step === 13) {
            this.game.worldMap.towerConstruction.SetupTower(CreateUnit(this.player.wcPlayer, this.GetTower(),
                firstCheckpointX + dist.xDividedBy18 - 2 * dist.yDividedBy9 - dist.yDividedBy18,
                firstCheckpointY + dist.yDividedBy18 - 2 * dist.xDividedBy9 - dist.xDividedBy18, bj_UNIT_FACING), this.player);
            return false;
        }
        if (this.step === 14) {
            this.game.worldMap.towerConstruction.SetupTower(CreateUnit(this.player.wcPlayer, this.GetTower(),
                firstCheckpointX - dist.xDividedBy9 + dist.xDividedBy18 - 2 * dist.yDividedBy9 - dist.yDividedBy18,
                firstCheckpointY - dist.yDividedBy9 + dist.yDividedBy18 - 2 * dist.xDividedBy9 - dist.xDividedBy18, bj_UNIT_FACING), this.player);
            return false;
        }
        if (this.step === 15) {
            this.game.worldMap.towerConstruction.SetupTower(CreateUnit(this.player.wcPlayer, this.GetTower(),
                firstCheckpointX - 2 * dist.xDividedBy9 + dist.xDividedBy18 - 2 * dist.yDividedBy9,
                firstCheckpointY - 2 * dist.yDividedBy9 + dist.yDividedBy18 - 2 * dist.xDividedBy9, bj_UNIT_FACING), this.player);
            return false;
        }
        if (this.step === 16) {
            this.game.worldMap.towerConstruction.SetupTower(CreateUnit(this.player.wcPlayer, this.GetTower(),
                firstCheckpointX - 3 * dist.xDividedBy9 + dist.xDividedBy18 - dist.yDividedBy9,
                firstCheckpointY - 3 * dist.yDividedBy9 + dist.yDividedBy18 - dist.xDividedBy9, bj_UNIT_FACING), this.player);
            return false;
        }
        if (this.step === 17) {
            this.game.worldMap.towerConstruction.SetupTower(CreateUnit(this.player.wcPlayer, this.GetTower(),
                firstCheckpointX - 3 * dist.xDividedBy9,
                firstCheckpointY - 3 * dist.yDividedBy9, bj_UNIT_FACING), this.player);
            return false;
        }
        if (this.step === 18) {
            this.game.worldMap.towerConstruction.SetupTower(CreateUnit(this.player.wcPlayer, this.GetTower(),
                firstCheckpointX - 3 * dist.xDividedBy9 + dist.yDividedBy9,
                firstCheckpointY - 3 * dist.yDividedBy9 + dist.xDividedBy9, bj_UNIT_FACING), this.player);
            return false;
        }
        if (this.step === 19) {
            this.game.worldMap.towerConstruction.SetupTower(CreateUnit(this.player.wcPlayer, this.GetTower(),
                firstCheckpointX - 3 * dist.xDividedBy9 + 2 * dist.yDividedBy9,
                firstCheckpointY - 3 * dist.yDividedBy9 + 2 * dist.xDividedBy9, bj_UNIT_FACING), this.player);
            return false;
        }
        if (this.step === 20) {
            this.game.worldMap.towerConstruction.SetupTower(CreateUnit(this.player.wcPlayer, this.GetTower(),
                firstCheckpointX - 2 * dist.xDividedBy9 + 3 * dist.yDividedBy9,
                firstCheckpointY - 2 * dist.yDividedBy9 + 3 * dist.xDividedBy9, 0.00), this.player);
            return false;
        }

        return true;


    }
}
