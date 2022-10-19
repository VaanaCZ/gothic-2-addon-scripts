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

	AI_Output (self ,self,"DIA_Herold_Announce_04_00"); //S�uchajcie, s�uchajcie, mieszka�cy Khorinis! Na rozkaz wielmo�nego Lorda Hagena, og�asza si�, co nast�puje!
	
	if (Kapitel <= 2)
	{
		randy = Hlp_Random (5);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_01"); //W zwi�zku z zaistnia�� sytuacj�, dla w�asnego bezpiecze�stwa obywatele powinni unika� las�w i bezdro�y dooko�a miasta.
			AI_Output (self ,self,"DIA_Herold_Announce_04_02"); //Co wi�cej, zabrania si� wszelkich kontakt�w ze zbuntowanymi wie�niakami.
		}
		else if (randy == 1)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_03"); //Od chwili obecnej, Lord Andre przejmuje wy��czne dow�dztwo nad nasz� stra��.
			AI_Output (self ,self,"DIA_Herold_Announce_04_04"); //Wszyscy mieszka�cy, kt�rzy posiadaj� jakiekolwiek przeszkolenie w zakresie walki, niech wst�puj� w szeregi stra�y.
		}
		else if (randy == 2)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_05"); //Wszelkie �rodki bezpiecze�stwa dotycz�ce g�rnego miasta zostan� jeszcze bardziej zaostrzone.
			AI_Output (self ,self,"DIA_Herold_Announce_04_06"); //Stra�nicy, strzeg�cy bram, nie b�d� przepuszcza� nikogo, kto nie posiada zezwolenia na wej�cie do miasta.
		}
		else if (randy == 3)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_07"); //We wszystkich miastach i regionach kr�lestwa zostaje wprowadzony stan wojenny.
			AI_Output (self ,self,"DIA_Herold_Announce_04_08"); //S�dziowie cywilni zostaj� pozbawieni swych praw, a ich obowi�zki przejmuj� kr�lewscy paladyni.
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //Ka�dy, kto pope�ni przest�pstwo lub sprzeciwi si� kr�lewskiej stra�y, podlega surowej karze. Egzekucj� tego prawa zajmie si� wielmo�ny Lord Andre.
			AI_Output (self ,self,"DIA_Herold_Announce_04_10"); //Ka�dy mieszkaniec Khorinis, kt�ry pope�ni� jakiekolwiek wykroczenie, ma obowi�zek zg�osi� si� natychmiast do Lorda Andre.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_11"); //W zwi�zku z atakiem zagra�aj�cym naszemu miastu, ka�dy jego mieszkaniec ma obowi�zek przygotowa� si� do walki tak, jak pozwala mu na to jego stan maj�tkowy.
			AI_Output (self ,self,"DIA_Herold_Announce_04_12"); //Dotyczy to zaopatrzenia si� w odpowiedni� zbroj� i or�, a tak�e natychmiastowego rozpocz�cia treningu bojowego.
		};
	}
	else if (Kapitel == 3)
	{
		IF (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_13"); //Najemnik Bennet, kt�ry podst�pnie zamordowa� paladyna Lothara, zosta� os�dzony w imi� Innosa.
			AI_Output (self ,self,"DIA_Herold_Announce_04_14"); //Wyrok: �mier� przez powieszenie. Egzekucja odb�dzie si� za par� dni, a jej dok�adny termin zostanie wkr�tce og�oszony.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_15"); //Kowal Bennet zosta� oczyszczony z wszelkich zarzut�w przez jednego z doradc�w Lorda Hagena.
		};	
	}
	else if (Kapitel == 4)
	{
			AI_Output (self ,self,"DIA_Herold_Announce_04_16"); //Pog�oski o pojawieniu si� smok�w w G�rniczej Dolinie s� nieprawdziwe.
			AI_Output (self ,self,"DIA_Herold_Announce_04_17"); //Plotki te rozsiewane s� przez wroga, kt�ry w ten spos�b pragnie zasia� strach i trwog� w sercach dzielnego ludu Myrtany.
			AI_Output (self ,self,"DIA_Herold_Announce_04_18"); //Aby oficjalnie zweryfikowa� i zdementowa� owe pog�oski, oddzia� dzielnych paladyn�w wraz z przewodnikiem zosta� wys�any do G�rniczej Doliny.
	}
	else	//Kapitel 5
	{
		randy = Hlp_Random (2);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_19"); //Smoki n�kaj�ce krain� zosta�y zg�adzone przez dzielne wojsko pod wodz� Lorda Hagena.
			AI_Output (self ,self,"DIA_Herold_Announce_04_20"); //Wkr�tce Kr�l Rhobar uwolni nar�d od plagi ork�w, a w kr�lestwie zn�w zapanuje dobrobyt.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_21"); //Lord Andre zostaje mianowany g��wnodowodz�cym miasta Khorinis.
			AI_Output (self ,self,"DIA_Herold_Announce_04_22"); //Lord Hagen oznajmi�, �e osobi�cie uda si� do G�rniczej Doliny, aby kontrolowa� za�adunek magicznej rudy na sw�j statek.
		};
	};
	AI_UseItemToState	(self,	Fakescroll,	-1);
};


/* 

			AI_Output (self ,self,"DIA_Herold_Announce_04_00"); //H�rt B�rger von Khorinis den Beschlu� des ehrenwerten Lord Hagen!
			AI_Output (self ,self,"DIA_Herold_Announce_04_02"); //An alle B�rger von Khorinis, vernehmt Lord Hagens Anordnungen zum Schutze unserer Stadt. 
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //H�rt ihr Bewohner von Khorinis und vernehmt das k�nigliche Dekret zur Aufrechterhaltung der �ffentlichen Ordnung.
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //An alle Bewohner von Khorinis, vernehmt Lord Hagens Anordnungen zum Schutze unserer Stadt. 





Kapitel 3 Spieler kommt aus dem Minental und hat mit Lord Hagen gesprochen
H�rt ihr B�ger von Khorinis. Ein Bote der Paladine brachte Kunde aus dem Minental
Unsere tapferen Paladine halten den Orks wehrhaft stand und erschliessen neue Minen f�r das K�nigreich!

Kapitel 3 Bennet ist im Knast
H�rt ihr B�rger von Khorinis
Der Schmied Bennet, der den ehrenwerten Paladin Lothar heimt�ckisch ermordert hat, ist im Namen Innos verurteilt worden. 
Das Urteil lautet Tod durch den Strick.

Kapitel 3 Bennet ist wieder frei
H�rt ihr B�rger,
Der Schmied Bennet wird freigesprochen, da seine Unschuld von einem klugen Berater Lord Hagens bewiesen wurde. 
So ist es Innos Wille und nach seiner Gerechtigkeit handeln wir. 
 
Kapitel 5 Start Drachen sind tot
H�rt B�rger von Khorinis
Die Drachen die das Land bedrohten wurden von tapferen M�nnern unter dem Befehl von Lord Hagen besiegt.   
Bald wird auch K�nig Rohbar das Land von den Orks befreien und das K�nigreich wird in neuem Glanz aufbl�hen!


Kapitel 5 Kurz vor Schlu� (Spieler war in der Biblothek) 
Der ehrenwerte Lord Hagen hat verk�ndet nun selbst ins Minental zu ziehen um daf�r zu sorgen das sein Schiff mit dem Erz beladen werden kann.  

*/
