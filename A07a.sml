structure Day7 =
struct

  fun readlist (infile : string) = let
  val ins = TextIO.openIn infile
  fun loop ins =
   case TextIO.inputLine ins of
      SOME line => line :: loop ins
    | NONE      => []
  in
    loop ins before TextIO.closeIn ins
  end;

  fun all l = case l of
    x::nil => List.nth (String.tokens Char.isSpace x, 0) :: nil
    | x::xs => (List.nth (String.tokens Char.isSpace x, 0)) :: (all xs)

  fun children l = case l of
    x::nil => let
      val str = String.tokens Char.isSpace x
    in
      if length str = 2 then [] else tl (tl (tl str))
    end
    | x::xs => let
      val str = String.tokens Char.isSpace x
    in
      if length str = 2 then children xs else (tl (tl (tl str))) @ (children xs)
    end

  fun comma str = 
    if String.str(String.sub (str, size(str)-1)) = ","
    then String.substring(str, 0, size(str)-1)
    else str

    fun id str = str

  fun findEl str1 str2 = case str1 of
    x::nil => x
    | x::xs => if List.exists (fn y => y = x) str2 then findEl xs str2 else x

fun main (prog_name, args) =
    let
      val input = readlist (List.nth (args, 1))
      val _ = print (findEl (all input) (map comma (children input)))
      val _ = print ("\n")
    in
      0
    end
end