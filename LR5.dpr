program LR5;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const   N=2000;

type TMAS=array[1..N] of Integer;

  procedure NewArr(var arr, newarr: TMAS; size : Integer);
  var i: Integer;
   begin
      for i:=1 to size do
       arr[i]:=newarr[i];
   end;

   procedure Swap( var A,B: Integer);
   var temp: Integer;
    begin
      temp:=A;
      A:=B;
      B:=temp;
    end;

  procedure SelectionSort(var A:TMAS; var size, Sravn, Perest: integer);
     var i,j,min:integer;
   begin
     Sravn:=0;
     Perest:= 0;
     for i:=1 to size-1 do
       begin
        min:=i;
        for j:=i+1 to size do
        begin
          Sravn:=Sravn+1;
          if A[j]<A[min] then min:=j;
        end;
        Swap(A[i],A[min]);
        Perest:=Perest+1;
       end;
   end;

function Power(t:Integer):integer;
 var i,s:Integer;
  begin
    s:=1;
    for i:=1 to t do
    begin
      s:=s*2;
    end;
    Power:=s;
  end;



procedure ShellSort(var SA: TMAS; const Size: integer; var Sravn, Perest: integer);
var t,k,i,j,tmp,m,numb:integer;
begin
  Sravn:= 0;
  Perest:= 0;
  t := Trunc(Ln(Size) / Ln(2)) - 1;      //number of steps
  for i:=t downto 1 do
  begin
    k:= Power(i) - 1;                    //value of step
    for j:=(k + 1) to Size do
    begin
      tmp:=SA[j];
      m:=j-k;
      numb:=0;
      While((m>=1) and (SA[m] > tmp)) do
      begin
        SA[m+k] := SA[m];
        m:=m-k;
        Sravn:=Sravn+1;
        Perest:=Perest+1;
        numb:=numb+1;
      end;
      SA[m+k] := tmp;
      if numb=0 then            //in case when numb=0, the elemest changes with itself, else exchanges are alredy counted
        Perest:=Perest+1;
      Sravn:=Sravn+1;
    end;
  end;
end;


procedure reverse(var A: TMAS; size: Integer);
 var i,temp:integer;
  begin
   for i:=1 to (size div 2) do
    begin
     temp:=A[i];
     A[i]:=A[size-i+1];
     A[size-i+1]:=temp;
    end;
  end;

procedure NewTableRow( k:integer; arrtype:string; var SelC, SelE, SheC, SheE: Integer);
begin
  Writeln('|',k:4,' el. |', '':15,'|', '':15,'|', '':15,'|', '':15,'|');
  Writeln('|',arrtype:9,'|',SelC:10,'':5, '|',SelE:10,'':5, '|',SheC:10,'':5, '|',SheE:10,'':5, '|');
  Writeln('|-------------------------------------------------------------------------|');
end;

procedure TableHead;
begin
  Writeln('---------------------------------------------------------------------------');
  Writeln('|         |    Selection Sorting #1       |        Shell Sorting #2       |');
  Writeln('|  Array  |---------------|---------------|---------------|---------------|');
  Writeln('|  type   |  Number of    |   Number of   |  Number of    |   Number of   |');
  Writeln('|         |  comparisons  |   exchanges   |  comparisons  |   exchanges   |');
  Writeln('|---------|---------------|---------------|---------------|---------------|');
end;

 var Selection,Shella,Main: TMAS;
 size,i,p,SelectionComparisons,SelectionExchanges,ShellComparisons,ShellExchanges: Integer;

BEGIN
  //Randomize;
  for i:=1 to N do
   begin
    Main[i] := Random(100);
    end;

    Writeln;
    TableHead;
     for p:=1 to 3 do
  begin

    case p of
      1 : size := 10;
      2 : size := 100;
      3 : size := 2000;
    end;
    NewArr(Selection,Main,size);
    NewArr(Shella,Main,size);




     // UNSORTED ARRAY
    SelectionSort(Selection,size,SelectionComparisons,SelectionExchanges);
    ShellSort(Shella,size,ShellComparisons,ShellExchanges);
    NewTableRow(size, 'unsorted' , SelectionComparisons,SelectionExchanges,ShellComparisons,ShellExchanges);

    // SORTED ARRAY
    SelectionSort(Selection,size,SelectionComparisons,SelectionExchanges);
    ShellSort(Shella,size,ShellComparisons,ShellExchanges);
    NewTableRow(size, 'sorted  ' , SelectionComparisons,SelectionExchanges,ShellComparisons,ShellExchanges);

    // REVERS ARRAY
    reverse(Selection,size);
    reverse(Shella,size);
    SelectionSort(Selection,size,SelectionComparisons,SelectionExchanges);
    ShellSort(Shella,size,ShellComparisons,ShellExchanges);
    NewTableRow(size, 'reverse.' , SelectionComparisons,SelectionExchanges,ShellComparisons,ShellExchanges);

  end;
  Readln;
END.

