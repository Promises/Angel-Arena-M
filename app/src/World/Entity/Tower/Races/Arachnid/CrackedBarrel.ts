import { Tower } from '../../Specs/Tower';
import { GenericAutoAttackTower } from '../../Specs/GenericAutoAttackTower';
import { LimitedTower } from '../../Specs/LimitedTower';

export class CrackedBarrel extends Tower implements LimitedTower {
    public MaxCount(): number {
        return 12;
    }


}
