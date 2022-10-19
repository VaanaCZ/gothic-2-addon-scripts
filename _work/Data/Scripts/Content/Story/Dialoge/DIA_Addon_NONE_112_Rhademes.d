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
	AI_Output (self, other, "DIA_Addon_Rhademes_EXIT_03_01"); //Jak sobie ¿yczysz...
	
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
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_00"); //Mój duch by³ uwiêziony przez ca³¹ wiecznoœæ.
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_01"); //W koñcu jestem wolny. Miecz ma NOWEGO powiernika.
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_02"); //Ostatnia komnata zosta³a otwarta.
		AI_Output (other, self, "DIA_Addon_Rhademes_First_15_03"); //Ale brama wygl¹da na zamkniêt¹!
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_04"); //To nie jest brama do ostatniej komnaty.
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_05"); //TA brama prowadzi do poprzedniego pomieszczenia.
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_06"); //Powiernik... zamkn¹³ j¹ za sob¹.
		
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
	description	= "Jak mogê otworzyæ bramê?";
};
FUNC INT DIA_Addon_Rhademes_Pforte_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Rhademes_Pforte_Info()
{
	AI_Output (other, self, "DIA_Addon_Rhademes_Pforte_15_00"); //Jak mogê otworzyæ bramê?
	AI_Output (self, other, "DIA_Addon_Rhademes_Pforte_03_01"); //Przesuñ... jedn¹ z dŸwigni.
	AI_Output (other, self, "DIA_Addon_Rhademes_Pforte_15_02"); //Dowoln¹?
	AI_Output (self, other, "DIA_Addon_Rhademes_Pforte_03_03"); //Wszystkie dŸwignie otwieraj¹ bramê.
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
	description	= "Nie wszystkie dŸwignie uruchamiaj¹ pu³apkê, tak?";
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
	AI_Output (other, self, "DIA_Addon_Rhademes_Hebel_15_00"); //Nie wszystkie dŸwignie uruchamiaj¹ pu³apkê, tak?
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
	description	= "Nie wierzê ci!";
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
	AI_Output (other, self, "DIA_Addon_Rhademes_DontBelieve_15_00"); //Nie wierzê ci!
	AI_Output (self, other, "DIA_Addon_Rhademes_DontBelieve_03_01"); //Nie, ja... zawsze mówiê prawdê.
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
	description	= "Twój ojciec zbudowa³ tê pu³apkê. Sk¹d mo¿esz wiedzieæ o jej dzia³aniu?";
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
	AI_Output (other, self, "DIA_Addon_Rhademes_DeinVater_15_00"); //Twój ojciec zbudowa³ tê pu³apkê. Sk¹d mo¿esz wiedzieæ o jej dzia³aniu?
	AI_Output (self, other, "DIA_Addon_Rhademes_DeinVater_03_01"); //QUARHODRON! Wci¹¿ s³yszê uderzenia m³ota... po drugiej stronie bramy... od tak dawna...
	AI_Output (self, other, "DIA_Addon_Rhademes_DeinVater_03_02"); //Miecz... pozwoli³ mi zobaczyæ... jego zemstê... za moj¹ pora¿kê...
	AI_Output (other, self, "DIA_Addon_Rhademes_DeinVater_15_03"); //To znaczy, ¿e widzia³eœ, która dŸwignia jest w³aœciwa?
	AI_Output (self, other, "DIA_Addon_Rhademes_DeinVater_03_04"); //Zapomnia³em to bardzo dawno temu.
	
	Info_ClearChoices (DIA_Addon_Rhademes_DeinVater);
	Info_AddChoice (DIA_Addon_Rhademes_DeinVater, "No to domyœl siê!", DIA_Addon_Rhademes_DeinVater_Guess);
	Info_AddChoice (DIA_Addon_Rhademes_DeinVater, "Spróbuj sobie przypomnieæ!", DIA_Addon_Rhademes_DeinVater_Remember);
	Info_AddChoice (DIA_Addon_Rhademes_DeinVater, "Myœl!", DIA_Addon_Rhademes_DeinVater_Think);
};
	
	// ------------------------
	var int Rhademes_fertig;
	
	// ------ zieh dran! ------
	func void B_Addon_Rhademes_Lever(var int choice)
	{
		AI_Output (self, other, "DIA_Addon_Rhademes_Lever_03_00"); //To by³o tak dawno temu...
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
	AI_Output (other, self, "DIA_Addon_Rhademes_DeinVater_Think_15_00"); //Myœl!
	B_Addon_Rhademes_Lever(1);
};

func void DIA_Addon_Rhademes_DeinVater_Remember()
{
	AI_Output (other, self, "DIA_Addon_Rhademes_DeinVater_Remember_15_00"); //Spróbuj sobie przypomnieæ!
	B_Addon_Rhademes_Lever(2);
};

func void DIA_Addon_Rhademes_DeinVater_Guess()
{
	AI_Output (other, self, "DIA_Addon_Rhademes_DeinVater_Guess_15_00"); //No to domyœl siê!
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
	AI_Output (self, other, "DIA_Addon_Rhademes_PERM_03_00"); //Jeœli masz doœæ si³y... wrzuæ go... w morskie odmêty...
	SC_TookRhademesTrap = TRUE;
	SC_TalkedToRhademAfter = TRUE;
	AI_StopProcessInfos (self);
};

			
			
				
		
	
		
			
	
	
	
	
	

	
		

	
	
	





















