export class HologramCheckpointDistance {
    public x: number;
    public y: number;
    public xDividedBy9: number;
    public xDividedBy18: number;
    public xDividedBy36: number;
    public yDividedBy9: number;
    public yDividedBy18: number;
    public yDividedBy36: number;

    constructor(x: number, y: number) {
        this.x = x;
        this.y = y;

        this.xDividedBy9 = this.x / 9;
        this.xDividedBy18 = this.x / 18;
        this.xDividedBy36 = this.x / 36;
        this.yDividedBy9 = this.y / 9;
        this.yDividedBy18 = this.y / 18;
        this.yDividedBy36 = this.y / 36;
    }
}
