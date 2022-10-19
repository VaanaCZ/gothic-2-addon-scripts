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
	description = "Najdu si vlastn� cestu! (KONEC)";
};
FUNC INT DIA_Addon_Rhademes_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Rhademes_EXIT_Info()
{
	AI_Output (other, self, "DIA_Addon_Rhademes_EXIT_15_00"); //Najdu cestu s�m!
	AI_Output (self, other, "DIA_Addon_Rhademes_EXIT_03_01"); //Jak chce�.
	
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
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_00"); //M�j duch byl nav�ky uv�zn�n.
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_01"); //Kone�n� jsem voln�. Me� m� NOV�HO nositele.
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_02"); //Posledn� komnata byla otev�ena.
		AI_Output (other, self, "DIA_Addon_Rhademes_First_15_03"); //Av�ak br�na z�st�v� uzav�ena.
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_04"); //Toto nen� br�na do posledn� komnaty.
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_05"); //TATO br�na vede pouze do p�eds�l�.
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_06"); //Nositel... zav�ela se za n�m.
		
		Rhademes_Understood = TRUE;
	}
	else //Spieler spricht Sprache nicht
	{
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_07"); //(podr�d�n�) Ghanima en Kandra Adanos?!
		B_Say (other, self, "$CANTUNDERSTANDTHIS");	
		AI_Output (self, other, "DIA_Addon_Rhademes_First_03_08"); //(zu�iv�) Bengla anthani!
		
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
	description	= "Jak otev�u br�nu?";
};
FUNC INT DIA_Addon_Rhademes_Pforte_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Rhademes_Pforte_Info()
{
	AI_Output (other, self, "DIA_Addon_Rhademes_Pforte_15_00"); //Jak otev�u br�nu?
	AI_Output (self, other, "DIA_Addon_Rhademes_Pforte_03_01"); //Pohni jednou z p�k.
	AI_Output (other, self, "DIA_Addon_Rhademes_Pforte_15_02"); //Jakoukoliv?
	AI_Output (self, other, "DIA_Addon_Rhademes_Pforte_03_03"); //V�echny tyto p�ky otv�raj� br�nu.
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
	description	= "V�echny p�ky ale br�nu nespust�, �e jo?";
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
	AI_Output (other, self, "DIA_Addon_Rhademes_Hebel_15_00"); //Ale ne v�echny spou�t�j� past, �e?
	AI_Output (self, other, "DIA_Addon_Rhademes_Hebel_03_01"); //Ano, p�esn� tak!
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
	description	= "Nev���m ti!";
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
	AI_Output (other, self, "DIA_Addon_Rhademes_DontBelieve_15_00"); //Nev���m ti!
	AI_Output (self, other, "DIA_Addon_Rhademes_DontBelieve_03_01"); //Av�ak j� hovo��m pouze pravdu.
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
	description	= "Kdy� tu past sestrojil tv�j otec, jak TY m��e� v�d�t, jak funguje?!";
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
	AI_Output (other, self, "DIA_Addon_Rhademes_DeinVater_15_00"); //Tu past vytvo�il tv�j otec � jak TY m��e� v�d�t, jak funguje?!
	AI_Output (self, other, "DIA_Addon_Rhademes_DeinVater_03_01"); //QUARHODRON! Je�t� st�le sly��m r�ny kladiv... na druh� stran� br�ny... po tak dlouh� dob�...
	AI_Output (self, other, "DIA_Addon_Rhademes_DeinVater_03_02"); //Me�... mi uk�zal... pomstu... za m� selh�n�.
	AI_Output (other, self, "DIA_Addon_Rhademes_DeinVater_15_03"); //Chce� ��ct, �e jsi vid�l, kter� p�ka je ta prav�?
	AI_Output (self, other, "DIA_Addon_Rhademes_DeinVater_03_04"); //U� jsem to d�vno zapomn�l.
	
	Info_ClearChoices (DIA_Addon_Rhademes_DeinVater);
	Info_AddChoice (DIA_Addon_Rhademes_DeinVater, "Pak h�dej!", DIA_Addon_Rhademes_DeinVater_Guess);
	Info_AddChoice (DIA_Addon_Rhademes_DeinVater, "Zkus si vzpomenout!", DIA_Addon_Rhademes_DeinVater_Remember);
	Info_AddChoice (DIA_Addon_Rhademes_DeinVater, "P�em��lej!", DIA_Addon_Rhademes_DeinVater_Think);
};
	
	// ------------------------
	var int Rhademes_fertig;
	
	// ------ zieh dran! ------
	func void B_Addon_Rhademes_Lever(var int choice)
	{
		AI_Output (self, other, "DIA_Addon_Rhademes_Lever_03_00"); //Bylo to tak d�vno...
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
	AI_Output (other, self, "DIA_Addon_Rhademes_DeinVater_Think_15_00"); //P�em��lej!
	B_Addon_Rhademes_Lever(1);
};

func void DIA_Addon_Rhademes_DeinVater_Remember()
{
	AI_Output (other, self, "DIA_Addon_Rhademes_DeinVater_Remember_15_00"); //Zkus si vzpomenout!
	B_Addon_Rhademes_Lever(2);
};

func void DIA_Addon_Rhademes_DeinVater_Guess()
{
	AI_Output (other, self, "DIA_Addon_Rhademes_DeinVater_Guess_15_00"); //Pak h�dej!
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
	AI_Output (self, other, "DIA_Addon_Rhademes_PERM_03_00"); //M�-li s�lu... pono� jej... do mo�sk�ch hlubin...
	SC_TookRhademesTrap = TRUE;
	SC_TalkedToRhademAfter = TRUE;
	AI_StopProcessInfos (self);
};

			
			
				
		
	
		
			
	
	
	
	
	

	
		

	
	
	





















