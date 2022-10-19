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

	AI_Output (self ,self,"DIA_Herold_Announce_04_00"); //Slyšte, obèané Khorinidu! Podle pâímého rozkazu ctihodného lorda Hagena vstupuje v platnost následující naâízení.
	
	if (Kapitel <= 2)
	{
		randy = Hlp_Random (5);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_01"); //Z bezpeènostních dùvodù se vstup do lesù a divoèiny kolem mêsta dùraznê nedoporuèuje.
			AI_Output (self ,self,"DIA_Herold_Announce_04_02"); //Navíc je pâísnê zakázán jakýkoli kontakt se vzbouâenými rolníky v pâilehlých oblastech.
		}
		else if (randy == 1)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_03"); //Tímto okamžikem se lord Andre stává vrchním velitelem naší domobrany.
			AI_Output (self ,self,"DIA_Herold_Announce_04_04"); //Všichni obèané našeho mêsta, kteâí dokážou udržet zbraà, jsou naléhavê žádáni, aby posílili âady královské domobrany.
		}
		else if (randy == 2)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_05"); //Bezpeènostní opatâení zajišãující ochranu horní èásti mêsta budou ještê více zpâísnêna.
			AI_Output (self ,self,"DIA_Herold_Announce_04_06"); //Strážcùm brány se nakazuje, aby se pâísnê drželi rozkazù a zabránili tak vstupu kohokoli nepovolaného.
		}
		else if (randy == 3)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_07"); //Ve všech mêstech a oblastech celé âíše tímto okamžikem vstupuje v platnost stanné právo.
			AI_Output (self ,self,"DIA_Herold_Announce_04_08"); //Všichni civilní soudci pâedají s okamžitou platností své úâady královským paladinùm.
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //Ctihodný lord Andre je povêâen co nejpâísnêjším potrestáním veškeré nezákonné èinnosti èi pokusù o odpor vùèi královské gardê.
			AI_Output (self ,self,"DIA_Herold_Announce_04_10"); //Každý obyvatel Khorinidu, který se proviní nezákonnou èinností, se bude okamžitê zodpovídat lordu Andremu.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_11"); //Z dùvodu bezprostâedního nebezpeèí útokù skâetù jsou všichni obèané žádáni, aby se na tuto hrozbu dostateènê pâipravili.
			AI_Output (self ,self,"DIA_Herold_Announce_04_12"); //Všichni nechã neprodlenê zapoènou s bojovým výcvikem a pâimêâenê se ozbrojí.
		};
	}
	else if (Kapitel == 3)
	{
		IF (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_13"); //Žoldnéâský kováâ Bennet, který podle zavraždil paladina Lothara, byl ve jménu Innose uznán vinným.
			AI_Output (self ,self,"DIA_Herold_Announce_04_14"); //Rozsudek zní smrt obêšením. Poprava se bude konat za nêkolik málo dnù.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_15"); //Kováâ Bennet byl zproštên obžaloby, protože rádce lorda Hagena prokázal jeho nevinu.
		};	
	}
	else if (Kapitel == 4)
	{
			AI_Output (self ,self,"DIA_Herold_Announce_04_16"); //Zvêsti, které vypovídají o pâítomnosti drakù v Hornickém údolí Khorinidu, se nezakládají na pravdê.
			AI_Output (self ,self,"DIA_Herold_Announce_04_17"); //Tyto povídaèky byly šíâeny nepâítelem, aby mezi odvážným lidem Myrtany vyvolaly paniku.
			AI_Output (self ,self,"DIA_Herold_Announce_04_18"); //Abychom tyto smêšné zvêsti vyvrátili, byla do Hornického údolí vyslána jednotka stateèných paladinù pod vedením jednoho z nich, jenž se v té oblasti dokonale vyzná.
	}
	else	//Kapitel 5
	{
		randy = Hlp_Random (2);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_19"); //Draci, kteâí ohrožovali naši zem, byli poraženi stateènými muži pod vedením lorda Hagena.
			AI_Output (self ,self,"DIA_Herold_Announce_04_20"); //Král Rhobar už brzy zbaví naši zemi skâetù a království znovu dosáhne dâívêjší slávy a rozkvêtu.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_21"); //Lord Andre pâevezme s okamžitou platností nejvyšší velení nad mêstem Khorinis.
			AI_Output (self ,self,"DIA_Herold_Announce_04_22"); //Lord Hagen prohlásil, že se osobnê zúèastní výpravy do Hornického údolí, aby zajistil, že jeho loë odtamtud odpluje jen a pouze s plným podpalubím magické rudy.
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
