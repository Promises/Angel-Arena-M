import { TowerMap } from '../../Specs/TowerMap';
import { RaceTowers } from '../RaceTowers';
import { OgreWarrior } from './OgreWarrior';
import { FleshGolem } from './FleshGolem';
import { RockGiant } from './RockGiant';
import { SeaGiant } from './SeaGiant';
import { OgreMagi } from './OgreMagi';
import { AncientGolem } from './AncientGolem';
import { IronGolemStatue } from './IronGolemStatue';


export class GiantsTowers extends RaceTowers {
    public AddTowersToList(list: TowerMap<number, object>): void {

        // Giants
        list.add(FourCC('oC35'), OgreWarrior);
        list.add(FourCC('o00G'), FleshGolem);
        list.add(FourCC('hC53'), RockGiant);
        list.add(FourCC('o00Y'), SeaGiant);
        list.add(FourCC('hC97'), OgreMagi);
        list.add(FourCC('o00X'), AncientGolem);
        list.add(FourCC('oC26'), IronGolemStatue);

    }

}
