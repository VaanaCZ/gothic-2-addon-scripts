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

	AI_Output (self ,self,"DIA_Herold_Announce_04_00"); //Hear ye, inhabitants of Khorinis! By the explicit order of the honorable Lord Hagen, the following decree is hereby enacted.
	
	if (Kapitel <= 2)
	{
		randy = Hlp_Random (5);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_01"); //Due to the general situation, the forests and wilderness near the city are to be avoided for your own protection.
			AI_Output (self ,self,"DIA_Herold_Announce_04_02"); //Furthermore, any contact with the rebelling peasantry in the surrounding areas is strictly forbidden.
		}
		else if (randy == 1)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_03"); //From this moment onward, Lord Andre will take the supreme command of our militia.
			AI_Output (self ,self,"DIA_Herold_Announce_04_04"); //All citizens of this city who have martial skills at their disposal are herewith urged to join the royal militia.
		}
		else if (randy == 2)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_05"); //The security measures for the protection of the upper quarter will be further strengthened.
			AI_Output (self ,self,"DIA_Herold_Announce_04_06"); //The guards on the gates are ordered to interpret the law in the strictest sense in order to prevent unauthorized entry.
		}
		else if (randy == 3)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_07"); //Martial law is immediately declared in all cities and regions of the realm.
			AI_Output (self ,self,"DIA_Herold_Announce_04_08"); //All civilian judges are to hand over their duties to the royal paladins, effective immediately.
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //The honorable Lord Andre is commanded to punish every crime or act of resistance against the king's guards most severely.
			AI_Output (self ,self,"DIA_Herold_Announce_04_10"); //Every inhabitant of Khorinis who is guilty of a crime is to report immediately to Lord Andre.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_11"); //By reason of the imminent danger of an attack by orcs, each inhabitant of the city is to prepare himself accordingly.
			AI_Output (self ,self,"DIA_Herold_Announce_04_12"); //Everyone is to begin training in the skills of combat immediately, and to arm himself appropriately.
		};
	}
	else if (Kapitel == 3)
	{
		IF (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_13"); //The mercenary smith Bennet, who treacherously murdered the paladin Lothar, has been condemned in the name of Innos.
			AI_Output (self ,self,"DIA_Herold_Announce_04_14"); //The sentence is death by hanging. The execution will take place in a few days.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_15"); //The smith Bennet has been declared free of guilt because his innocence was proven by a clever adviser of Lord Hagen.
		};	
	}
	else if (Kapitel == 4)
	{
			AI_Output (self ,self,"DIA_Herold_Announce_04_16"); //The rumors which have arisen concerning the appearance of dragons in the Valley of Mines of Khorinis are not to be believed.
			AI_Output (self ,self,"DIA_Herold_Announce_04_17"); //The rumors are spread by the enemy in order to promote fear and terror among the brave people of Myrtana.
			AI_Output (self ,self,"DIA_Herold_Announce_04_18"); //In order to refute the ridiculous assertions, a troop of brave paladins under the command of one familiar with the place has set out for the Valley of Mines.
	}
	else	//Kapitel 5
	{
		randy = Hlp_Random (2);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_19"); //The dragons which threatened the land have been defeated by brave men under the command of Lord Hagen.
			AI_Output (self ,self,"DIA_Herold_Announce_04_20"); //Soon, King Rhobar will have freed the land of orcs and the kingdom will blossom with a new splendor.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_21"); //Lord Andre will take supreme command of the city of Khorinis, effective immediately.
			AI_Output (self ,self,"DIA_Herold_Announce_04_22"); //Lord Hagen has announced that he will personally go to the Valley of Mines in order to ensure that his ship can be laden with magic ore.
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
