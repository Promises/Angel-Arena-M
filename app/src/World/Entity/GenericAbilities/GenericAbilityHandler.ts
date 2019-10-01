import { WarcraftMaul } from '../../WarcraftMaul';
import { GenericAbility } from './GenericAbility';
import { FrostAttack } from './FrostAttack';
import { Trigger } from '../../../JassOverrides/Trigger';
import { Move } from './Move';
import { FelineSwiftness } from './NightElfAncientProtector/FelineSwiftness';
import { NaturesNourishment } from './NightElfAncientProtector/NaturesNourishment';
import { WolvenFury } from './NightElfAncientProtector/WolvenFury';
import { UnchargedRuneMorph } from './Elementalist/UnchargedRuneMorph';
import { ElementalistSettings } from './Elementalist/ElementalistSettings';
import { SiphonEnergy } from './Elementalist/SiphonEnergy';
import { Enchantment } from './AllianceOfBlades/Enchantment';
import { Transfuse } from './AllianceOfBlades/Transfuse';
import { Infuse } from './AllianceOfBlades/Infuse';
import { Sacrifice } from './AllianceOfBlades/Sacrifice';
import { AlchemicalTransmutation } from './AllianceOfBlades/AlchemicalTransmutation';
import { ChannelItem } from './AllianceOfBlades/ChannelItem';
import { Trade } from './AllianceOfBlades/Trade';
import { AwakenDormantPheonixEgg } from './Elementalist/AwakenDormantPheonixEgg';
import { PayTheToll } from './Void/PayTheToll';
import { VoidLordAbility } from './Void/VoidLordAbility';
import { PurchaseVoidBeast } from './Void/PurchaseVoidBeast';
import { PurchaseVoidBeing } from './Void/PurchaseVoidBeing';
import { PurchaseVoidLord } from './Void/PurchaseVoidLord';
import { PurchaseVoidMonstrosity } from './Void/PurchaseVoidMonstrosity';
import { DrinkWaterRune } from './Elementalist/DrinkWaterRune';
import { UndeadUpgrade } from './Elementalist/UndeadUpgrade';
import { PurchaseVoidMinion } from './Void/PurchaseVoidMinion';
import { ConstructThaddius } from './Naxxramas/StalaggFeugen';

export class GenericAbilityHandler {
    private readonly game: WarcraftMaul;
    private abilities: object[] = [];
    private activeAbilities: GenericAbility[] = [];
    public  elementalistSettings: ElementalistSettings = new ElementalistSettings();
    private targetUnitOnEffectAbilities: (GenericAbility & AbilityOnEffectTargetsUnit)[] = [];
    private targetUnitOnCastAbilities: (GenericAbility & AbilityOnCastTargetsUnit)[] = [];
    private targetUnitOnEffectAbilitiesTrigger: Trigger;
    private targetUnitOnCastAbilitiesTrigger: Trigger;

    constructor(game: WarcraftMaul) {
        this.game = game;
        this.AddAbilitiesToList();
        this.SetupAbilities();
        this.targetUnitOnEffectAbilitiesTrigger = new Trigger();
        this.targetUnitOnEffectAbilitiesTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_EFFECT);
        this.targetUnitOnEffectAbilitiesTrigger.AddAction(() => this.DoTargetUnitOnEffectAbilities());
        this.targetUnitOnCastAbilitiesTrigger = new Trigger();
        this.targetUnitOnCastAbilitiesTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_CAST);
        this.targetUnitOnCastAbilitiesTrigger.AddAction(() => this.DoTargetUnitOnCastAbilities());
    }

    private AddAbilitiesToList(): void {
        this.abilities.push(FrostAttack);
        this.abilities.push(Move);
        this.abilities.push(FelineSwiftness);
        this.abilities.push(NaturesNourishment);
        this.abilities.push(WolvenFury);
        this.abilities.push(UnchargedRuneMorph);
        this.abilities.push(SiphonEnergy);
        this.abilities.push(DrinkWaterRune);
        this.abilities.push(Enchantment);
        this.abilities.push(Transfuse);
        this.abilities.push(Infuse);
        this.abilities.push(Sacrifice);
        this.abilities.push(AlchemicalTransmutation);
        this.abilities.push(ChannelItem);
        this.abilities.push(Trade);
        this.abilities.push(AwakenDormantPheonixEgg);
        this.abilities.push(UndeadUpgrade);
        this.abilities.push(PayTheToll);
        this.abilities.push(VoidLordAbility);
        this.abilities.push(PurchaseVoidBeing);
        this.abilities.push(PurchaseVoidBeast);
        this.abilities.push(PurchaseVoidMonstrosity);
        this.abilities.push(PurchaseVoidLord);
        this.abilities.push(PurchaseVoidMinion);
        this.abilities.push(ConstructThaddius);
    }


    private DoTargetUnitOnEffectAbilities(): void {
        for (const tower of this.targetUnitOnEffectAbilities) {
            if (tower.Condition()) {
                tower.TargetOnEffectAction();
            }
        }
    }
    private DoTargetUnitOnCastAbilities(): void {
        for (const tower of this.targetUnitOnCastAbilities) {
            if (tower.Condition()) {
                tower.TargetOnCastAction();
            }
        }
    }

    private SetupAbilities(): void {

        for (const ability of this.abilities) {
            // @ts-ignore
            const ObjectExtendsAbility: GenericAbility = new ability(this.game);


            if (ObjectExtendsAbility.IsAttackActionAbility()) {
                this.game.gameDamageEngine.AddInitialDamageEventAbility(ObjectExtendsAbility);
            }

            if (ObjectExtendsAbility.IsAbilityOnEffectTargetsUnit()) {
                this.targetUnitOnEffectAbilities.push(ObjectExtendsAbility);
            }

            if (ObjectExtendsAbility.IsAbilityOnCastTargetsUnit()) {
                this.targetUnitOnCastAbilities.push(ObjectExtendsAbility);
            }

            this.activeAbilities.push(ObjectExtendsAbility);
        }

    }
}
