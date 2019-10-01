import { Trigger } from '../../JassOverrides/Trigger';
import { WarcraftMaul } from '../WarcraftMaul';
import { Defender } from '../Entity/Players/Defender';
import { Race } from './Races/Race';
import {
    HybridTierEight,
    HybridTierFive,
    HybridTierFour,
    HybridTierNine,
    HybridTierOne,
    HybridTierSeven,
    HybridTierSix,
    HybridTierThree,
    HybridTierTwo, HybridTower,
} from '../../Generated/hybridRandomGEN';

export class RacePicking {
    raceSelectTrigger: Trigger;
    private game: WarcraftMaul;
    public HybridPool: Map<string, HybridTower> = new Map<string, HybridTower>();

    constructor(game: WarcraftMaul) {
        this.game = game;
        this.raceSelectTrigger = new Trigger();
        this.raceSelectTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SELL_ITEM);
        this.raceSelectTrigger.AddCondition(() => this.RaceSelectionConditions());
        this.raceSelectTrigger.AddAction(() => this.RaceSelectionActions());
        this.CreateHybridPool();
        CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('h03Q'), -1920.00, 3000.00, 0.00);
        CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('h00H'), -1920.00, 2624.00, 0.00);
        CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('h00O'), -1920.00, 2240.00, 0.00);
        CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('h03C'), -1920.00, 1856.00, 0.00);
        CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('h03K'), -1920.00, 1472.00, 0.00);
        for (const player of this.game.players.values()) {
            CreateUnit(player.wcPlayer, FourCC('e00C'), -1920.00, 3000.00, 0.00);
            CreateUnit(player.wcPlayer, FourCC('e00C'), -1920.00, 2624.00, 0.00);
            CreateUnit(player.wcPlayer, FourCC('e00C'), -1920.00, 2240.00, 0.00);
            CreateUnit(player.wcPlayer, FourCC('e00C'), -1920.00, 1856.00, 0.00);
            CreateUnit(player.wcPlayer, FourCC('e00C'), -1920.00, 1472.00, 0.00);
        }
    }

    private RaceSelectionConditions() {
        if (GetUnitTypeId(GetSellingUnit()) == FourCC('h03Q')) {
            return true;
        }

        if (GetUnitTypeId(GetSellingUnit()) == FourCC('h00H')) {
            return true;
        }

        if (GetUnitTypeId(GetSellingUnit()) == FourCC('h00O')) {
            return true;
        }

        if (GetUnitTypeId(GetSellingUnit()) == FourCC('h03C')) {
            return true;
        }

        if (GetUnitTypeId(GetSellingUnit()) == FourCC('h03K')) {
            return true;
        }

        return false;

    }

    public PickRaceForPlayerByItem(player: Defender, raceItem: number): void {
        if (raceItem === FourCC('I00W')) { // Hardcore random
            if (player.hasHybridRandomed) {
                player.giveLumber(1);
                player.sendMessage('You can only use Hybrid Random!');
            } else {
                if (!player.hasHardcoreRandomed) {
                    if (player.repickCounter === 0) {
                        player.hasHardcoreRandomed = true;
                        this.HardCoreRandomRace(player);
                        player.giveGold(50);
                    } else {
                        player.giveLumber(1);
                        player.sendMessage('You can\'t hardcore random after using normal random!');
                    }
                } else {
                    player.giveLumber(1);
                }
            }
        } else if (raceItem === FourCC('I00V')) { // Normal Random
            if (player.hasHybridRandomed) {
                player.giveLumber(1);
                player.sendMessage('You can only use Hybrid Random!');
            } else {
                if (player.repickCounter < 3) {
                    player.repickCounter++;
                }
                player.giveGold(40 - 10 * player.repickCounter);
                this.NormalRandomRace(player);
            }
        } else if (raceItem === FourCC('I00X')) { // Hybrid Random
            if (player.repickCounter === 0 && !player.hasHardcoreRandomed && !player.hasNormalPicked) {
                this.HybridRandomRace(player);
                player.giveGold(50);
            } else {
                player.giveLumber(1);
                player.sendMessage('You can\'t hybrid random after using normal / hardcore random / selection!');
            }
        } else {
            if (player.hasHybridRandomed) {
                player.giveLumber(1);
                player.sendMessage('You can only use Hybrid Random!');
            } else {
                player.hasNormalPicked = true;
                this.GetSelectedRace(player, raceItem);
            }
        }
    }

    private RaceSelectionActions(): void {
        const player: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(GetBuyingUnit())));
        if (!player) {
            return;
        }
        this.game.worldMap.playerSpawns[player.id].isOpen = true;
        const soldItem: number = GetItemTypeId(GetSoldItem());
        this.PickRaceForPlayerByItem(player, soldItem);


    }

    private HardCoreRandomRace(player: Defender) {
        const randomedRace = this.RandomRace(player);
        if (randomedRace) {
            SendMessage(player.getNameWithColour() + ' has |cFF375FF1ra|r|cFF364CF0nd|r|cFF3535EFom|r|cFF4A34EFed|r ' + randomedRace.name);
        }


    }

    private GiveBuyingPlayerBuilder(player: Defender, randomedRace: Race) {
        randomedRace.pickAction(player);
    }

    private GetSelectedRace(player: Defender, soldItem: number) {
        const race = this.getRaceFromItem(soldItem);
        if (race) {
            player.races.push(race);
            race.pickAction(player);
            SendMessage(player.getNameWithColour() + ' has chosen ' + race.name);
        }

    }


    private getRaceFromItem(soldItem: number) {
        for (const race of this.game.worldMap.races) {
            if (FourCC(race.itemid) == soldItem) {
                return race;
            }
        }
        return null;
    }

    private NormalRandomRace(player: Defender) {
        const randomedRace = this.RandomRace(player);
        if (randomedRace) {
            SendMessage(player.getNameWithColour() + ' has |cFF375FF1ra|r|cFF364CF0nd|r|cFF3535EFom|r|cFF4A34EFed|r ' + randomedRace.name);
        }

    }

    private RandomRace(player: Defender): Race | undefined {
        const randomNumber = Util.RandomInt(0, this.game.worldMap.races.length - 1);
        if (this.game.worldMap.races.length - player.races.length <= this.game.worldMap.disabledRaces) {
            player.giveLumber(1);
            return;
        }
        const randomedRace = this.game.worldMap.races[randomNumber];

        if (!randomedRace.enabled) {
            return this.RandomRace(player);
        }

        if (player.hasRace(randomedRace)) {
            return this.RandomRace(player);
        }

        player.races.push(randomedRace);
        this.GiveBuyingPlayerBuilder(player, randomedRace);
        return randomedRace;
    }

    private randomChoice(myarr: any[], blacklist: any[] = []): any {
        let choice = myarr[Math.floor(Math.random() * myarr.length)];
        if (blacklist.indexOf(choice) >= 0) {
            choice = this.randomChoice(myarr, blacklist);
        }

        return choice;
    }

    private HybridRandomRace(player: Defender) {
        const t1 = this.randomChoice(HybridTierOne, player.hybridTowers).id;
        const t2 = this.randomChoice(HybridTierTwo, player.hybridTowers).id;
        const t3 = this.randomChoice(HybridTierThree, player.hybridTowers).id;
        const t4 = this.randomChoice(HybridTierFour, player.hybridTowers).id;
        const t5 = this.randomChoice(HybridTierFive, player.hybridTowers).id;
        const t6 = this.randomChoice(HybridTierSix, player.hybridTowers).id;
        const t7 = this.randomChoice(HybridTierSeven, player.hybridTowers).id;
        const t8 = this.randomChoice(HybridTierEight, player.hybridTowers).id;
        const t9 = this.randomChoice(HybridTierNine, player.hybridTowers).id;
        player.hybridTowers = [];
        player.hybridTowers.push(t1);
        player.hybridTowers.push(t2);
        player.hybridTowers.push(t3);
        player.hybridTowers.push(t4);
        player.hybridTowers.push(t5);
        player.hybridTowers.push(t6);
        player.hybridTowers.push(t7);
        player.hybridTowers.push(t8);
        player.hybridTowers.push(t9);

        if (!player.hasHybridRandomed) {
            player.hybridBuilder = CreateUnit(player.wcPlayer, FourCC('e00I'), player.getCenterX(), player.getCenterY(), 0);
            // player.races.push(player.hybridBuilder);

        }

        player.hasHybridRandomed = true;

        for (const tower of HybridTierOne) {
            if (tower.id !== t1) {
                SetPlayerUnitAvailableBJ(FourCC(tower.id), false, player.wcPlayer);
            } else {
                SetPlayerUnitAvailableBJ(FourCC(tower.id), true, player.wcPlayer);
            }
        }
        for (const tower of HybridTierTwo) {
            if (tower.id !== t2) {
                SetPlayerUnitAvailableBJ(FourCC(tower.id), false, player.wcPlayer);
            } else {
                SetPlayerUnitAvailableBJ(FourCC(tower.id), true, player.wcPlayer);
            }
        }
        for (const tower of HybridTierThree) {
            if (tower.id !== t3) {
                SetPlayerUnitAvailableBJ(FourCC(tower.id), false, player.wcPlayer);
            } else {
                SetPlayerUnitAvailableBJ(FourCC(tower.id), true, player.wcPlayer);
            }
        }
        for (const tower of HybridTierFour) {
            if (tower.id !== t4) {
                SetPlayerUnitAvailableBJ(FourCC(tower.id), false, player.wcPlayer);
            } else {
                SetPlayerUnitAvailableBJ(FourCC(tower.id), true, player.wcPlayer);
            }
        }
        for (const tower of HybridTierFive) {
            if (tower.id !== t5) {
                SetPlayerUnitAvailableBJ(FourCC(tower.id), false, player.wcPlayer);
            } else {
                SetPlayerUnitAvailableBJ(FourCC(tower.id), true, player.wcPlayer);
            }
        }
        for (const tower of HybridTierSix) {
            if (tower.id !== t6) {
                SetPlayerUnitAvailableBJ(FourCC(tower.id), false, player.wcPlayer);
            } else {
                SetPlayerUnitAvailableBJ(FourCC(tower.id), true, player.wcPlayer);
            }
        }
        for (const tower of HybridTierSeven) {
            if (tower.id !== t7) {
                SetPlayerUnitAvailableBJ(FourCC(tower.id), false, player.wcPlayer);
            } else {
                SetPlayerUnitAvailableBJ(FourCC(tower.id), true, player.wcPlayer);
            }
        }
        for (const tower of HybridTierEight) {
            if (tower.id !== t8) {
                SetPlayerUnitAvailableBJ(FourCC(tower.id), false, player.wcPlayer);
            } else {
                SetPlayerUnitAvailableBJ(FourCC(tower.id), true, player.wcPlayer);
            }
        }
        for (const tower of HybridTierNine) {
            if (tower.id !== t9) {
                SetPlayerUnitAvailableBJ(FourCC(tower.id), false, player.wcPlayer);
            } else {
                SetPlayerUnitAvailableBJ(FourCC(tower.id), true, player.wcPlayer);
            }
        }

        SendMessage(player.getNameWithColour() + ' has |cFFB0F442hy|r|cFF8CF442b|r|cFF42F4C5r|r|cFF42F4F1id|r randomed!');


    }

    private CreateHybridPool(): void {
        HybridTierEight.forEach(d => this.HybridPool.set(d.id, d));
        HybridTierFive.forEach(d => this.HybridPool.set(d.id, d));
        HybridTierFour.forEach(d => this.HybridPool.set(d.id, d));
        HybridTierNine.forEach(d => this.HybridPool.set(d.id, d));
        HybridTierOne.forEach(d => this.HybridPool.set(d.id, d));
        HybridTierSeven.forEach(d => this.HybridPool.set(d.id, d));
        HybridTierSix.forEach(d => this.HybridPool.set(d.id, d));
        HybridTierThree.forEach(d => this.HybridPool.set(d.id, d));
        HybridTierTwo.forEach(d => this.HybridPool.set(d.id, d));
    }
}
