structure Day3 =
struct

  fun sqrt (n:int):int =
    let
      fun sqrt' x s = if s*s < x then sqrt' x (s+2) else s
    in
      sqrt' n 1
    end;

  fun abs (x:int):int = if x > 0 then x else if x < 0 then 0-x else 0;

  fun manhattan (x:int, y:int):int = abs(x) + abs(y);

  fun spiral (n:int) =
    let
      val b = sqrt n
      val side = b div 2
      val diff = b*b - n
    in
      case diff div (b - 1)
        of 0 => manhattan (side - diff, side)
        | 1 => manhattan (0-side, side - (diff-2*side))
        | 2 => manhattan (0 - side + (diff-4*side), 0-side)
        | 3 => manhattan (side, 0 - side + (diff-6*side))
        | _ => 0
    end

fun main (prog_name, args) =
    let
      val SOME x = Int.fromString(List.nth (args, 1))
      val _ = print (Int.toString (spiral x))
      val _ = print ("\n")
    in
      1
    end
end