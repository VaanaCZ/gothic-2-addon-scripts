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
	description = "Sam poszukam drogi! (KONIEC)";
};
FUNC INT DIA_Addon_Rhademes_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Rhademes_EXIT_Info()
{
	AI_Output (other, self, "DIA_Addon_Rhademes_EXIT_15_00"); //Sam poszukam drogi!
	AI_Output (self, other, "DIA_Addon_Rhademes_EXIT_03_01"); //Jak sobie �yczysz...
	
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
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_00"); //M�j duch by� uwi�ziony przez ca�� wieczno��.
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_01"); //W ko�cu jestem wolny. Miecz ma NOWEGO powiernika.
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_02"); //Ostatnia komnata zosta�a otwarta.
		AI_Output (other, self, "DIA_Addon_Rhademes_First_15_03"); //Ale brama wygl�da na zamkni�t�!
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_04"); //To nie jest brama do ostatniej komnaty.
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_05"); //TA brama prowadzi do poprzedniego pomieszczenia.
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_06"); //Powiernik... zamkn�� j� za sob�.
		
		Rhademes_Understood = TRUE;
	}
	else //Spieler spricht Sprache nicht
	{
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_07"); //Ghanima en Kandra Adanos?
		B_Say (other, self, "$CANTUNDERSTANDTHIS");	
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_08"); //Bengla anthani!
		
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
	description	= "Jak mog� otworzy� bram�?";
};
FUNC INT DIA_Addon_Rhademes_Pforte_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Rhademes_Pforte_Info()
{
	AI_Output (other, self, "DIA_Addon_Rhademes_Pforte_15_00"); //Jak mog� otworzy� bram�?
	AI_Output (self, other, "DIA_Addon_Rhademes_Pforte_03_01"); //Przesu�... jedn� z d�wigni.
	AI_Output (other, self, "DIA_Addon_Rhademes_Pforte_15_02"); //Dowoln�?
	AI_Output (self, other, "DIA_Addon_Rhademes_Pforte_03_03"); //Wszystkie d�wignie otwieraj� bram�.
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
	description	= "Nie wszystkie d�wignie uruchamiaj� pu�apk�, tak?";
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
	AI_Output (other, self, "DIA_Addon_Rhademes_Hebel_15_00"); //Nie wszystkie d�wignie uruchamiaj� pu�apk�, tak?
	AI_Output (self, other, "DIA_Addon_Rhademes_Hebel_03_01"); //Tak!
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
	description	= "Nie wierz� ci!";
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
	AI_Output (other, self, "DIA_Addon_Rhademes_DontBelieve_15_00"); //Nie wierz� ci!
	AI_Output (self, other, "DIA_Addon_Rhademes_DontBelieve_03_01"); //Nie, ja... zawsze m�wi� prawd�.
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
	description	= "Tw�j ojciec zbudowa� t� pu�apk�. Sk�d mo�esz wiedzie� o jej dzia�aniu?";
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
	AI_Output (other, self, "DIA_Addon_Rhademes_DeinVater_15_00"); //Tw�j ojciec zbudowa� t� pu�apk�. Sk�d mo�esz wiedzie� o jej dzia�aniu?
	AI_Output (self, other, "DIA_Addon_Rhademes_DeinVater_03_01"); //QUARHODRON! Wci�� s�ysz� uderzenia m�ota... po drugiej stronie bramy... od tak dawna...
	AI_Output (self, other, "DIA_Addon_Rhademes_DeinVater_03_02"); //Miecz... pozwoli� mi zobaczy�... jego zemst�... za moj� pora�k�...
	AI_Output (other, self, "DIA_Addon_Rhademes_DeinVater_15_03"); //To znaczy, �e widzia�e�, kt�ra d�wignia jest w�a�ciwa?
	AI_Output (self, other, "DIA_Addon_Rhademes_DeinVater_03_04"); //Zapomnia�em to bardzo dawno temu.
	
	Info_ClearChoices (DIA_Addon_Rhademes_DeinVater);
	Info_AddChoice (DIA_Addon_Rhademes_DeinVater, "No to domy�l si�!", DIA_Addon_Rhademes_DeinVater_Guess);
	Info_AddChoice (DIA_Addon_Rhademes_DeinVater, "Spr�buj sobie przypomnie�!", DIA_Addon_Rhademes_DeinVater_Remember);
	Info_AddChoice (DIA_Addon_Rhademes_DeinVater, "My�l!", DIA_Addon_Rhademes_DeinVater_Think);
};
	
	// ------------------------
	var int Rhademes_fertig;
	
	// ------ zieh dran! ------
	func void B_Addon_Rhademes_Lever(var int choice)
	{
		AI_Output (self, other, "DIA_Addon_Rhademes_Lever_03_00"); //To by�o tak dawno temu...
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
	AI_Output (other, self, "DIA_Addon_Rhademes_DeinVater_Think_15_00"); //My�l!
	B_Addon_Rhademes_Lever(1);
};

func void DIA_Addon_Rhademes_DeinVater_Remember()
{
	AI_Output (other, self, "DIA_Addon_Rhademes_DeinVater_Remember_15_00"); //Spr�buj sobie przypomnie�!
	B_Addon_Rhademes_Lever(2);
};

func void DIA_Addon_Rhademes_DeinVater_Guess()
{
	AI_Output (other, self, "DIA_Addon_Rhademes_DeinVater_Guess_15_00"); //No to domy�l si�!
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
	AI_Output (self, other, "DIA_Addon_Rhademes_PERM_03_00"); //Je�li masz do�� si�y... wrzu� go... w morskie odm�ty...
	SC_TookRhademesTrap = TRUE;
	SC_TalkedToRhademAfter = TRUE;
	AI_StopProcessInfos (self);
};

			
			
				
		
	
		
			
	
	
	
	
	

	
		

	
	
	





















