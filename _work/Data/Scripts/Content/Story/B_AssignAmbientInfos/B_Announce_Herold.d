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

	AI_Output (self ,self,"DIA_Herold_Announce_04_00"); //Słuchajcie, słuchajcie, mieszkańcy Khorinis! Na rozkaz wielmożnego Lorda Hagena, ogłasza się, co następuje!
	
	if (Kapitel <= 2)
	{
		randy = Hlp_Random (5);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_01"); //W związku z zaistniałą sytuacją, dla własnego bezpieczeństwa obywatele powinni unikać lasów i bezdroży dookoła miasta.
			AI_Output (self ,self,"DIA_Herold_Announce_04_02"); //Co więcej, zabrania się wszelkich kontaktów ze zbuntowanymi wieśniakami.
		}
		else if (randy == 1)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_03"); //Od chwili obecnej, Lord Andre przejmuje wyłączne dowództwo nad naszą strażą.
			AI_Output (self ,self,"DIA_Herold_Announce_04_04"); //Wszyscy mieszkańcy, którzy posiadają jakiekolwiek przeszkolenie w zakresie walki, niech wstępują w szeregi straży.
		}
		else if (randy == 2)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_05"); //Wszelkie środki bezpieczeństwa dotyczące górnego miasta zostaną jeszcze bardziej zaostrzone.
			AI_Output (self ,self,"DIA_Herold_Announce_04_06"); //Strażnicy, strzegący bram, nie będą przepuszczać nikogo, kto nie posiada zezwolenia na wejście do miasta.
		}
		else if (randy == 3)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_07"); //We wszystkich miastach i regionach królestwa zostaje wprowadzony stan wojenny.
			AI_Output (self ,self,"DIA_Herold_Announce_04_08"); //Sędziowie cywilni zostają pozbawieni swych praw, a ich obowiązki przejmują królewscy paladyni.
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //Każdy, kto popełni przestępstwo lub sprzeciwi się królewskiej straży, podlega surowej karze. Egzekucją tego prawa zajmie się wielmożny Lord Andre.
			AI_Output (self ,self,"DIA_Herold_Announce_04_10"); //Każdy mieszkaniec Khorinis, który popełnił jakiekolwiek wykroczenie, ma obowiązek zgłosić się natychmiast do Lorda Andre.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_11"); //W związku z atakiem zagrażającym naszemu miastu, każdy jego mieszkaniec ma obowiązek przygotować się do walki tak, jak pozwala mu na to jego stan majątkowy.
			AI_Output (self ,self,"DIA_Herold_Announce_04_12"); //Dotyczy to zaopatrzenia się w odpowiednią zbroję i oręż, a także natychmiastowego rozpoczęcia treningu bojowego.
		};
	}
	else if (Kapitel == 3)
	{
		IF (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_13"); //Najemnik Bennet, który podstępnie zamordował paladyna Lothara, został osądzony w imię Innosa.
			AI_Output (self ,self,"DIA_Herold_Announce_04_14"); //Wyrok: śmierć przez powieszenie. Egzekucja odbędzie się za parę dni, a jej dokładny termin zostanie wkrótce ogłoszony.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_15"); //Kowal Bennet został oczyszczony z wszelkich zarzutów przez jednego z doradców Lorda Hagena.
		};	
	}
	else if (Kapitel == 4)
	{
			AI_Output (self ,self,"DIA_Herold_Announce_04_16"); //Pogłoski o pojawieniu się smoków w Górniczej Dolinie są nieprawdziwe.
			AI_Output (self ,self,"DIA_Herold_Announce_04_17"); //Plotki te rozsiewane są przez wroga, który w ten sposób pragnie zasiać strach i trwogę w sercach dzielnego ludu Myrtany.
			AI_Output (self ,self,"DIA_Herold_Announce_04_18"); //Aby oficjalnie zweryfikować i zdementować owe pogłoski, oddział dzielnych paladynów wraz z przewodnikiem został wysłany do Górniczej Doliny.
	}
	else	//Kapitel 5
	{
		randy = Hlp_Random (2);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_19"); //Smoki nękające krainę zostały zgładzone przez dzielne wojsko pod wodzą Lorda Hagena.
			AI_Output (self ,self,"DIA_Herold_Announce_04_20"); //Wkrótce Król Rhobar uwolni naród od plagi orków, a w królestwie znów zapanuje dobrobyt.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_21"); //Lord Andre zostaje mianowany głównodowodzącym miasta Khorinis.
			AI_Output (self ,self,"DIA_Herold_Announce_04_22"); //Lord Hagen oznajmił, że osobiście uda się do Górniczej Doliny, aby kontrolować załadunek magicznej rudy na swój statek.
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
