// ***************
// B_Announce_Herold 
// ***************

func void B_Announce_Herold ()
{
	var int randy;
	if ( C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp		(self);
		B_TurnToNpc		(self,	hero);
	};
	
	// ------ NSC steckt ggf. Waffe weg ------
	AI_RemoveWeapon (self);
	
	CreateInvItem		(self,	Fakescroll);
	AI_UseItemToState	(self,	Fakescroll,	1);

	AI_Output (self ,self,"DIA_Herold_Announce_04_00"); //S³uchajcie, s³uchajcie, mieszkañcy Khorinis! Na rozkaz wielmo¿nego Lorda Hagena, og³asza siê, co nastêpuje!
	
	if (Kapitel <= 2)
	{
		randy = Hlp_Random (5);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_01"); //W zwi¹zku z zaistnia³¹ sytuacj¹, dla w³asnego bezpieczeñstwa obywatele powinni unikaæ lasów i bezdro¿y dooko³a miasta.
			AI_Output (self ,self,"DIA_Herold_Announce_04_02"); //Co wiêcej, zabrania siê wszelkich kontaktów ze zbuntowanymi wieœniakami.
		}
		else if (randy == 1)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_03"); //Od chwili obecnej, Lord Andre przejmuje wy³¹czne dowództwo nad nasz¹ stra¿¹.
			AI_Output (self ,self,"DIA_Herold_Announce_04_04"); //Wszyscy mieszkañcy, którzy posiadaj¹ jakiekolwiek przeszkolenie w zakresie walki, niech wstêpuj¹ w szeregi stra¿y.
		}
		else if (randy == 2)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_05"); //Wszelkie œrodki bezpieczeñstwa dotycz¹ce górnego miasta zostan¹ jeszcze bardziej zaostrzone.
			AI_Output (self ,self,"DIA_Herold_Announce_04_06"); //Stra¿nicy, strzeg¹cy bram, nie bêd¹ przepuszczaæ nikogo, kto nie posiada zezwolenia na wejœcie do miasta.
		}
		else if (randy == 3)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_07"); //We wszystkich miastach i regionach królestwa zostaje wprowadzony stan wojenny.
			AI_Output (self ,self,"DIA_Herold_Announce_04_08"); //Sêdziowie cywilni zostaj¹ pozbawieni swych praw, a ich obowi¹zki przejmuj¹ królewscy paladyni.
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //Ka¿dy, kto pope³ni przestêpstwo lub sprzeciwi siê królewskiej stra¿y, podlega surowej karze. Egzekucj¹ tego prawa zajmie siê wielmo¿ny Lord Andre.
			AI_Output (self ,self,"DIA_Herold_Announce_04_10"); //Ka¿dy mieszkaniec Khorinis, który pope³ni³ jakiekolwiek wykroczenie, ma obowi¹zek zg³osiæ siê natychmiast do Lorda Andre.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_11"); //W zwi¹zku z atakiem zagra¿aj¹cym naszemu miastu, ka¿dy jego mieszkaniec ma obowi¹zek przygotowaæ siê do walki tak, jak pozwala mu na to jego stan maj¹tkowy.
			AI_Output (self ,self,"DIA_Herold_Announce_04_12"); //Dotyczy to zaopatrzenia siê w odpowiedni¹ zbrojê i orê¿, a tak¿e natychmiastowego rozpoczêcia treningu bojowego.
		};
	}
	else if (Kapitel == 3)
	{
		IF (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_13"); //Najemnik Bennet, który podstêpnie zamordowa³ paladyna Lothara, zosta³ os¹dzony w imiê Innosa.
			AI_Output (self ,self,"DIA_Herold_Announce_04_14"); //Wyrok: œmieræ przez powieszenie. Egzekucja odbêdzie siê za parê dni, a jej dok³adny termin zostanie wkrótce og³oszony.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_15"); //Kowal Bennet zosta³ oczyszczony z wszelkich zarzutów przez jednego z doradców Lorda Hagena.
		};	
	}
	else if (Kapitel == 4)
	{
			AI_Output (self ,self,"DIA_Herold_Announce_04_16"); //Pog³oski o pojawieniu siê smoków w Górniczej Dolinie s¹ nieprawdziwe.
			AI_Output (self ,self,"DIA_Herold_Announce_04_17"); //Plotki te rozsiewane s¹ przez wroga, który w ten sposób pragnie zasiaæ strach i trwogê w sercach dzielnego ludu Myrtany.
			AI_Output (self ,self,"DIA_Herold_Announce_04_18"); //Aby oficjalnie zweryfikowaæ i zdementowaæ owe pog³oski, oddzia³ dzielnych paladynów wraz z przewodnikiem zosta³ wys³any do Górniczej Doliny.
	}
	else	//Kapitel 5
	{
		randy = Hlp_Random (2);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_19"); //Smoki nêkaj¹ce krainê zosta³y zg³adzone przez dzielne wojsko pod wodz¹ Lorda Hagena.
			AI_Output (self ,self,"DIA_Herold_Announce_04_20"); //Wkrótce Król Rhobar uwolni naród od plagi orków, a w królestwie znów zapanuje dobrobyt.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_21"); //Lord Andre zostaje mianowany g³ównodowodz¹cym miasta Khorinis.
			AI_Output (self ,self,"DIA_Herold_Announce_04_22"); //Lord Hagen oznajmi³, ¿e osobiœcie uda siê do Górniczej Doliny, aby kontrolowaæ za³adunek magicznej rudy na swój statek.
		};
	};
	AI_UseItemToState	(self,	Fakescroll,	-1);
};


/* 

			AI_Output (self ,self,"DIA_Herold_Announce_04_00"); //Hört Bürger von Khorinis den Beschluß des ehrenwerten Lord Hagen!
			AI_Output (self ,self,"DIA_Herold_Announce_04_02"); //An alle Bürger von Khorinis, vernehmt Lord Hagens Anordnungen zum Schutze unserer Stadt. 
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //Hört ihr Bewohner von Khorinis und vernehmt das königliche Dekret zur Aufrechterhaltung der öffentlichen Ordnung.
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //An alle Bewohner von Khorinis, vernehmt Lord Hagens Anordnungen zum Schutze unserer Stadt. 





Kapitel 3 Spieler kommt aus dem Minental und hat mit Lord Hagen gesprochen
Hört ihr Büger von Khorinis. Ein Bote der Paladine brachte Kunde aus dem Minental
Unsere tapferen Paladine halten den Orks wehrhaft stand und erschliessen neue Minen für das Königreich!

Kapitel 3 Bennet ist im Knast
Hört ihr Bürger von Khorinis
Der Schmied Bennet, der den ehrenwerten Paladin Lothar heimtückisch ermordert hat, ist im Namen Innos verurteilt worden. 
Das Urteil lautet Tod durch den Strick.

Kapitel 3 Bennet ist wieder frei
Hört ihr Bürger,
Der Schmied Bennet wird freigesprochen, da seine Unschuld von einem klugen Berater Lord Hagens bewiesen wurde. 
So ist es Innos Wille und nach seiner Gerechtigkeit handeln wir. 
 
Kapitel 5 Start Drachen sind tot
Hört Bürger von Khorinis
Die Drachen die das Land bedrohten wurden von tapferen Männern unter dem Befehl von Lord Hagen besiegt.   
Bald wird auch König Rohbar das Land von den Orks befreien und das Königreich wird in neuem Glanz aufblühen!


Kapitel 5 Kurz vor Schluß (Spieler war in der Biblothek) 
Der ehrenwerte Lord Hagen hat verkündet nun selbst ins Minental zu ziehen um dafür zu sorgen das sein Schiff mit dem Erz beladen werden kann.  

*/
