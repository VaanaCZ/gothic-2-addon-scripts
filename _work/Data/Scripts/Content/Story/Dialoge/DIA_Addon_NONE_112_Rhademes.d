// ***********************************************************
//							EXIT 
// ***********************************************************

instance DIA_Addon_Rhademes_EXIT   (C_INFO)
{
	npc         = NONE_ADDON_112_Rhademes;
	nr          = 999;
	condition   = DIA_Addon_Rhademes_EXIT_Condition;
	information = DIA_Addon_Rhademes_EXIT_Info;
	permanent   = TRUE;
	description = "Ich werde mir selbst einen Weg suchen! (ENDE)";
};
FUNC INT DIA_Addon_Rhademes_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Rhademes_EXIT_Info()
{
	AI_Output (other, self, "DIA_Addon_Rhademes_EXIT_15_00"); //Ich werde mir selbst einen Weg suchen!
	AI_Output (self, other, "DIA_Addon_Rhademes_EXIT_03_01"); //Wie du willst ...
	
	AI_StopProcessInfos (self);
};

// ***********************************************************
//							First 
// ***********************************************************
var int Rhademes_Understood;
// -----------------------------------------------------------	

instance DIA_Addon_Rhademes_First   (C_INFO)
{
	npc         = NONE_ADDON_112_Rhademes;
	nr          = 1;
	condition   = DIA_Addon_Rhademes_First_Condition;
	information = DIA_Addon_Rhademes_First_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Rhademes_First_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Rhademes_Understood == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Rhademes_First_Info()
{
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_00"); //Eine Ewigkeit lang war mein Geist gefangen.
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_01"); //Nun bin ich endlich frei. Das Schwert hat einen NEUEN Träger.
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_02"); //Die letzte Kammer wurde geöffnet.
		AI_Output (other, self, "DIA_Addon_Rhademes_First_15_03"); //Aber die Pforte sieht ziemlich verschlossen aus!
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_04"); //Dies hier ist nicht die Pforte zur letzten Kammer.
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_05"); //DIESE Pforte führt dich in den Raum davor.
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_06"); //Der Träger ... hat sie hinter sich verschlossen.
		
		Rhademes_Understood = TRUE;
	}
	else //Spieler spricht Sprache nicht
	{
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_07"); //(leidend) Ghanima en Kandra Adanos?!
		B_Say (other, self, "$CANTUNDERSTANDTHIS");	
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_08"); //(verärgert) Bengla anthani!
		
		AI_StopProcessInfos (self);
	};
};

// ***********************************************************
//						Wie Pforte auf  				//E1
// ***********************************************************

instance DIA_Addon_Rhademes_Pforte (C_INFO)
{
	npc         = NONE_ADDON_112_Rhademes;
	nr          = 2;
	condition   = DIA_Addon_Rhademes_Pforte_Condition;
	information = DIA_Addon_Rhademes_Pforte_Info;
	permanent   = FALSE;
	description	= "Wie öffne ich die Pforte?";
};
FUNC INT DIA_Addon_Rhademes_Pforte_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Rhademes_Pforte_Info()
{
	AI_Output (other, self, "DIA_Addon_Rhademes_Pforte_15_00"); //Wie öffne ich die Pforte?
	AI_Output (self, other, "DIA_Addon_Rhademes_Pforte_03_01"); //Bewege ... einen der Hebel.
	AI_Output (other, self, "DIA_Addon_Rhademes_Pforte_15_02"); //Irgendeinen?
	AI_Output (self, other, "DIA_Addon_Rhademes_Pforte_03_03"); //All diese Hebel öffnen die Pforte.
};

// ***********************************************************
//						Hebel & Falle				//E2
// ***********************************************************

instance DIA_Addon_Rhademes_Hebel (C_INFO)
{
	npc         = NONE_ADDON_112_Rhademes;
	nr          = 3;
	condition   = DIA_Addon_Rhademes_Hebel_Condition;
	information = DIA_Addon_Rhademes_Hebel_Info;
	permanent   = FALSE;
	description	= "Nicht alle Hebel lösen die Falle aus, richtig?";
};
FUNC INT DIA_Addon_Rhademes_Hebel_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Rhademes_Pforte))
	&& (!Npc_KnowsInfo(other, DIA_Addon_Rhademes_DeinVater))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Rhademes_Hebel_Info()
{
	AI_Output (other, self, "DIA_Addon_Rhademes_Hebel_15_00"); //Nicht alle Hebel lösen die Falle aus, richtig?
	AI_Output (self, other, "DIA_Addon_Rhademes_Hebel_03_01"); //Doch, das tun sie!
};

// ***********************************************************
//						Glaube dir nicht				//E2
// ***********************************************************

instance DIA_Addon_Rhademes_DontBelieve (C_INFO)
{
	npc         = NONE_ADDON_112_Rhademes;
	nr          = 4;
	condition   = DIA_Addon_Rhademes_DontBelieve_Condition;
	information = DIA_Addon_Rhademes_DontBelieve_Info;
	permanent   = FALSE;
	description	= "Ich glaube dir nicht!";
};
FUNC INT DIA_Addon_Rhademes_DontBelieve_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Rhademes_Pforte))
	&& (!Npc_KnowsInfo (other, DIA_Addon_Rhademes_DeinVater))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Rhademes_DontBelieve_Info()
{
	AI_Output (other, self, "DIA_Addon_Rhademes_DontBelieve_15_00"); //Ich glaube dir nicht!
	AI_Output (self, other, "DIA_Addon_Rhademes_DontBelieve_03_01"); //Doch ich ... sage nur die Wahrheit.
};

// ***********************************************************
//						Dein Vater				//E2
// ***********************************************************

instance DIA_Addon_Rhademes_DeinVater (C_INFO)
{
	npc         = NONE_ADDON_112_Rhademes;
	nr          = 5;
	condition   = DIA_Addon_Rhademes_DeinVater_Condition;
	information = DIA_Addon_Rhademes_DeinVater_Info;
	permanent   = FALSE;
	description	= "Dein Vater hat die Falle erbaut, woher willst DU wissen, wie sie funktioniert?!";
};
FUNC INT DIA_Addon_Rhademes_DeinVater_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Rhademes_Pforte))
	&& (Npc_HasItems (other, ItMi_Addon_Stone_04) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Rhademes_DeinVater_Info()
{
	AI_Output (other, self, "DIA_Addon_Rhademes_DeinVater_15_00"); //Dein Vater hat die Falle erbaut, woher willst DU wissen, wie sie funktioniert?!
	AI_Output (self, other, "DIA_Addon_Rhademes_DeinVater_03_01"); //QUARHODRON! Ich höre noch immer die Hammerschläge ... auf der anderen Seite des Tores ... seit so langer Zeit ...
	AI_Output (self, other, "DIA_Addon_Rhademes_DeinVater_03_02"); //Das Schwert ... ließ mich sehen ... seine Rache ... für mein Versagen ...
	AI_Output (other, self, "DIA_Addon_Rhademes_DeinVater_15_03"); //Das heißt, du hast gesehen, welcher Hebel der richtige ist?
	AI_Output (self, other, "DIA_Addon_Rhademes_DeinVater_03_04"); //Ich habe es seit langem vergessen.
	
	Info_ClearChoices (DIA_Addon_Rhademes_DeinVater);
	Info_AddChoice (DIA_Addon_Rhademes_DeinVater, "Dann Rate!", DIA_Addon_Rhademes_DeinVater_Guess);
	Info_AddChoice (DIA_Addon_Rhademes_DeinVater, "Versuch dich zu erinnern!", DIA_Addon_Rhademes_DeinVater_Remember);
	Info_AddChoice (DIA_Addon_Rhademes_DeinVater, "Denk nach!", DIA_Addon_Rhademes_DeinVater_Think);
};
	
	// ------------------------
	var int Rhademes_fertig;
	
	// ------ zieh dran! ------
	func void B_Addon_Rhademes_Lever(var int choice)
	{
		AI_Output (self, other, "DIA_Addon_Rhademes_Lever_03_00"); //Es ist so lange her...
		AI_StopProcessInfos (self);
		
		if (choice <= 1)
		{
			AI_GotoWP (self,"ADW_ADANOSTEMPEL_RHADEMES_04"); 
		}
		else if (choice == 2)
		{
			AI_GotoWP (self,"ADW_ADANOSTEMPEL_RHADEMES_04"); 
		}
		else //choice >= 3
		{
			AI_GotoWP (self,"ADW_ADANOSTEMPEL_RHADEMES_04"); 
		};
				
		AI_UseMob (self, "LEVER", 1);
		
		Rhademes_fertig = TRUE;
	};
	
func void DIA_Addon_Rhademes_DeinVater_Think()
{
	AI_Output (other, self, "DIA_Addon_Rhademes_DeinVater_Think_15_00"); //Denk nach!
	B_Addon_Rhademes_Lever(1);
};

func void DIA_Addon_Rhademes_DeinVater_Remember()
{
	AI_Output (other, self, "DIA_Addon_Rhademes_DeinVater_Remember_15_00"); //Versuch dich zu errinnern!
	B_Addon_Rhademes_Lever(2);
};

func void DIA_Addon_Rhademes_DeinVater_Guess()
{
	AI_Output (other, self, "DIA_Addon_Rhademes_DeinVater_Guess_15_00"); //Dann rate!
	B_Addon_Rhademes_Lever(3);
};

// ***********************************************************
//							PERM 
// ***********************************************************

instance DIA_Addon_Rhademes_PERM (C_INFO)
{
	npc         = NONE_ADDON_112_Rhademes;
	nr          = 2;
	condition   = DIA_Addon_Rhademes_PERM_Condition;
	information = DIA_Addon_Rhademes_PERM_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};
FUNC INT DIA_Addon_Rhademes_PERM_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Rhademes_fertig == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Rhademes_PERM_Info()
{
	AI_Output (self, other, "DIA_Addon_Rhademes_PERM_03_00"); //Wenn du die Kraft dazu hast ... versenke es ... in den Tiefen des Meeres ...
	SC_TookRhademesTrap = TRUE;
	SC_TalkedToRhademAfter = TRUE;
	AI_StopProcessInfos (self);
};

			
			
				
		
	
		
			
	
	
	
	
	

	
		

	
	
	





















