/**
 *  [Void] Purchase void Being
 *  Buy the void being with void fragments
 */
import { GenericAbility } from '../GenericAbility';
import { WarcraftMaul } from '../../../WarcraftMaul';
import { Defender } from '../../Players/Defender';


export class PurchaseVoidBeing extends GenericAbility implements AbilityOnCastTargetsUnit {

    constructor(game: WarcraftMaul) {
        super('A0BB', game);
    }

    public TargetOnCastAction(): void {
        const owner: Defender | undefined = this.game.players.get(GetPlayerId(GetOwningPlayer(GetSpellAbilityUnit())));
        if (owner) {
            if (owner.GetVoidFragments() >= 100) {
                owner.SetVoidFragments(owner.GetVoidFragments() - 100);
            }
        }

    }


}
