
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Kap1_EXIT   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 999;
	condition   = DIA_Neoras_Kap1_EXIT_Condition;
	information = DIA_Neoras_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Neoras_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Neoras_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Hallo   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 2;
	condition   = DIA_Neoras_Hallo_Condition;
	information = DIA_Neoras_Hallo_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Neoras_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Neoras_Hallo_Info()
{
	AI_Output (self ,other,"DIA_Neoras_Hallo_01_00"); //Co... co je? Proč mę obtęžuješ? Nevidíš, že jsem uprostâed extrémnę komplikovaného experimentu?
	AI_Output (other,self ,"DIA_Neoras_Hallo_15_01"); //Nechtęl jsem tę vyrušovat.
	AI_Output (self ,other,"DIA_Neoras_Hallo_01_02"); //Už se stalo. -vzdych- No, co potâebuješ?
};
///////////////////////////////////////////////////////////////////////
//	Info Arbeit
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Arbeit   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 5;
	condition   = DIA_Neoras_Arbeit_Condition;
	information = DIA_Neoras_Arbeit_Info;
	permanent   = FALSE;
	description	= "Nemáš pro mę nęjakou práci?";
};
FUNC INT DIA_Neoras_Arbeit_Condition()
{	
	if (MIS_KlosterArbeit == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Neoras_Arbeit_Info()
{
	AI_Output (other,self ,"DIA_Neoras_Arbeit_15_00"); //Nemáš pro mę nęjakou práci?
	AI_Output (self ,other,"DIA_Neoras_Arbeit_01_01"); //Ano, potâebuji byliny pro své pokusy. Byliny si pęstujeme sami, ale došly nám ohnivé kopâivy.
	AI_Output (self ,other,"DIA_Neoras_Arbeit_01_02"); //Sedm kvętů by męlo stačit. Pâines mi je - ach, ještę nęco - chybí mi recept na magické lektvary.
	AI_Output (self ,other,"DIA_Neoras_Arbeit_01_03"); //Pokud bys jej našel, byl bych ti velice vdęčný.
	
	MIS_NeorasPflanzen = LOG_RUNNING;
	MIS_NeorasRezept = LOG_RUNNING;
	
	Log_CreateTopic (Topic_NeorasPflanzen,LOG_MISSION);
	Log_SetTopicStatus (Topic_NeorasPflanzen,LOG_RUNNING);
	B_LogEntry (Topic_NeorasPflanzen,"Musím alchymistovi, mistru Neorasovi, pâinést sedm ohnivých kopâiv.");
	
	Log_CreateTopic (Topic_Neorasrezept,LOG_MISSION);
	Log_SetTopicStatus (Topic_Neorasrezept,LOG_RUNNING);
	B_LogEntry (Topic_Neorasrezept,"Mistr Neoras postrádá recept na lektvary na doplnęní many.");

	if Npc_KnowsInfo (other, DIA_Opolos_beibringen)
	{
		B_LogEntry (Topic_Neorasrezept,"Tohle musí být recept, který po mnę chtęl Opolos.");
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Rezept abliefern
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Rezept   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 6;
	condition   = DIA_Neoras_Rezept_Condition;
	information = DIA_Neoras_Rezept_Info;
	permanent   = TRUE;
	description	= "Co se toho receptu týče...";
};
FUNC INT DIA_Neoras_Rezept_Condition()
{	
	if (MIS_NeorasRezept == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Neoras_Rezept_Info()
{
	AI_Output (other,self ,"DIA_Neoras_Rezept_15_00"); //Co se toho receptu týče...
	
	if B_GiveInvItems (other, self, ItWr_ManaRezept,1)
	{
		AI_Output (other,self ,"DIA_Neoras_Rezept_15_01"); //Našel jsem ho.
		AI_Output (self ,other,"DIA_Neoras_Rezept_01_02"); //Výbornę. Už jsem se bál, že jsem ho nadobro ztratil.
		AI_Output (self ,other,"DIA_Neoras_Rezept_01_03"); //Na důkaz mé vdęčnosti si vezmi tenhle magický lektvar.
		
		MIS_NeorasRezept = LOG_SUCCESS;
		B_GivePlayerXP (XP_NeorasRezept);
		B_GiveInvItems (self, other, ItPo_Mana_02,1);
	}
	else
	{
		AI_Output (other,self ,"DIA_Neoras_Rezept_15_04"); //Ještę jsem ho nenašel.
		AI_Output (self ,other,"DIA_Neoras_Rezept_01_05"); //No, v tom pâípadę doufám, že se ti to podaâí.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Flieder abliefern
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Flieder   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 7;
	condition   = DIA_Neoras_Flieder_Condition;
	information = DIA_Neoras_Flieder_Info;
	permanent   = TRUE;
	description	= "Mám pro tebe nęjaké ohnivé kopâivy.";
};
FUNC INT DIA_Neoras_Flieder_Condition()
{	
	if (MIS_NeorasPflanzen == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Neoras_Flieder_Info()
{
	AI_Output (other,self ,"DIA_Neoras_Flieder_15_00"); //Mám pro tebe nęjaké ohnivé kopâivy.
	
	if B_GiveInvItems (other, self, ItPl_Mana_Herb_01,7)
	{
		AI_Output (self ,other,"DIA_Neoras_Flieder_01_01"); //Výbornę, mohu se pustit do práce. Vezmi si tenhle svitek s kouzlem 'vętrná pęst', snad se ti bude hodit.
		
		MIS_NeorasPflanzen = LOG_SUCCESS;
		B_GivePlayerXP (XP_NeorasPflanzen);
		B_GiveInvItems (self, other, ItSc_Windfist,1);
	}
	else
	{
		AI_Output (self ,other,"DIA_Neoras_Flieder_01_02"); //Vážnę? Ale nepâinesl jsi jich dost. Potâebuji jich SEDM.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_TEACH		(C_INFO)
{
	npc			 = 	KDF_506_Neoras;
	nr			 =  10;
	condition	 = 	DIA_Neoras_TEACH_Condition;
	information	 = 	DIA_Neoras_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Mohu se u tebe učit?";
};
func int DIA_Neoras_TEACH_Condition ()
{	
	return TRUE;
};
func void DIA_Neoras_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Neoras_TEACH_15_00"); //Mohu se u tebe učit?
	
	if (other.guild == GIL_KDF)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Neoras_TEACH_01_01"); //Budu ti pâednášet tajemství alchymie.
		
		Info_ClearChoices 	(DIA_Neoras_TEACH);
		Info_AddChoice 		(DIA_Neoras_TEACH,DIALOG_BACK,DIA_Neoras_TEACH_BACK);
	
		if ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
		{
			Info_AddChoice 		(DIA_Neoras_TEACH,B_BuildLearnString ("Esence hojivé síly", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)),DIA_Neoras_TEACH_HEALTH_01);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
		{
			Info_AddChoice	  (DIA_Neoras_TEACH, B_BuildLearnString ("Extrakt hojivé síly", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)), DIA_Neoras_TEACH_Health_02);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
		{
			Info_AddChoice	  (DIA_Neoras_TEACH, B_BuildLearnString ("Elixír hojivé síly", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_03)), DIA_Neoras_TEACH_Health_03);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
		{
			Info_AddChoice	  (DIA_Neoras_TEACH, B_BuildLearnString ("Elixír života", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), DIA_Neoras_TEACH_Perm_Health);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
		{
			Info_AddChoice	  (DIA_Neoras_TEACH, B_BuildLearnString ("Esence many", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)), DIA_Neoras_TEACH_Mana_01);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
		{
			Info_AddChoice	  (DIA_Neoras_TEACH, B_BuildLearnString ("Extrakt many", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_02)), DIA_Neoras_TEACH_Mana_02);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
		{
			Info_AddChoice	  (DIA_Neoras_TEACH, B_BuildLearnString ("Elixír many", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_03)), DIA_Neoras_TEACH_Mana_03);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
		{
			Info_AddChoice	  (DIA_Neoras_TEACH, B_BuildLearnString ("Elixír ducha", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)), DIA_Neoras_TEACH_Perm_Mana);
		};
		
	}
	else if (hero.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Neoras_TEACH_01_02"); //Novice neučím. Pokud bys byl jednoho dne pâijat do kruhu ohnę -
		AI_Output (self, other, "DIA_Neoras_TEACH_01_03"); //pak bych ti mohl ukázat, jak míchat mocné lektvary.
	}
	else
	{
		AI_Output (self, other, "DIA_Neoras_TEACH_01_04"); //Své vędomosti pâedávám pouze členům naší církve.
	};
};
FUNC VOID DIA_Neoras_TEACH_BACK()
{
	Info_ClearChoices 	(DIA_Neoras_TEACH);
};
FUNC VOID DIA_Neoras_TEACH_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_01);
};
FUNC VOID DIA_Neoras_TEACH_HEALTH_02()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_02);
};
FUNC VOID DIA_Neoras_TEACH_Health_03()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_03);
};
FUNC VOID DIA_Neoras_TEACH_Perm_Health()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Health);
};
FUNC VOID DIA_Neoras_TEACH_MANA_01()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01);
};
FUNC VOID DIA_Neoras_TEACH_MANA_02()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_02);
};
FUNC VOID DIA_Neoras_TEACH_MANA_03()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_03);
};
FUNC VOID DIA_Neoras_TEACH_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Mana);
};

//#####################################################################
//##
//##	Kapitel 2
//##
//#####################################################################
 
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Kap2_EXIT   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 999;
	condition   = DIA_Neoras_Kap2_EXIT_Condition;
	information = DIA_Neoras_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Neoras_Kap2_EXIT_Condition()
{
	if Kapitel == 2
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Neoras_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
}; 

//#####################################################################
//##
//##	Kapitel 3
//##
//#####################################################################
 
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Kap3_EXIT   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 999;
	condition   = DIA_Neoras_Kap3_EXIT_Condition;
	information = DIA_Neoras_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Neoras_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Neoras_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Trank brauen 
///////////////////////////////////////////////////////////////////////

INSTANCE DIA_Neoras_BrewPotion   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 39;
	condition   = DIA_Neoras_BrewPotion_Condition;
	information = DIA_Neoras_BrewPotion_Info;
	permanent   = TRUE;
	description = "Mohl bys mi namíchat lektvar?";
};
FUNC INT DIA_Neoras_BrewPotion_Condition()
{
	if (NeorasBrewsForYou == FALSE)
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Neoras_BrewPotion_Info()
{
	AI_Output (other,self ,"DIA_Neoras_BrewPotion_15_00"); //Mohl bys mi namíchat lektvar?
	
	if (hero.guild == GIL_NOV)
	{
		AI_Output (self ,other,"DIA_Neoras_BrewPotion_01_01"); //Na novice jsi velice neomalený. Bęž si za svými povinnostmi.
		AI_Output (self ,other,"DIA_Neoras_BrewPotion_01_02"); //Vše, co potâebuješ, si můžeš koupit od Goraxe.
	}
	else
	{
		AI_Output (self ,other,"DIA_Neoras_BrewPotion_01_03"); //Pochybuješ o mých schopnostech? Dokážu namíchat libovolný lektvar.
		AI_Output (other,self ,"DIA_Neoras_BrewPotion_15_04"); //Dobrá.
		AI_Output (self ,other,"DIA_Neoras_BrewPotion_01_05"); //Ne tak rychle, pochopitelnę mi musíš pâinést potâebné ingredience a složit malý poplatek na pokrytí nákladů a materiálu.
		AI_Output (other,self ,"DIA_Neoras_BrewPotion_15_06"); //Kolik chceš?
		AI_Output (self ,other,"DIA_Neoras_BrewPotion_01_07"); //Za samotné namíchání si âíkám 10 zlatých.
		
		NeorasBrewsForYou = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Was brauche ich für einen...
///////////////////////////////////////////////////////////////////////
/*
INSTANCE DIA_Neoras_Ingrediences   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 38;
	condition   = DIA_Neoras_Ingrediences_Condition;
	information = DIA_Neoras_Ingrediences_Info;
	permanent   = TRUE;
	description = "Welche Zutaten brauche ich für...";
};
FUNC INT DIA_Neoras_Ingrediences_Condition()
{
	if (NeorasBrewsForYou == TRUE)
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Neoras_Ingrediences_Info()
{
	Info_ClearChoices (DIA_Neoras_Ingrediences);
	Info_AddChoice (DIA_Neoras_Ingrediences,DIALOG_BACK,DIA_Neoras_Ingrediences_Back);
	Info_AddChoice (DIA_Neoras_Ingrediences,"einen Trank der Geschwindigkeit?",DIA_Neoras_Ingrediences_Speed);
	Info_AddChoice (DIA_Neoras_Ingrediences,"ein Mana Extrakt?",DIA_Neoras_Ingrediences_Mana);
	Info_AddChoice (DIA_Neoras_Ingrediences,"ein Extrakt der Heilung?",DIA_Neoras_Ingrediences_Health);
};

FUNC VOID DIA_Neoras_Ingrediences_Back ()
{
	Info_ClearChoices (DIA_Neoras_Ingrediences);
};

FUNC VOID DIA_Neoras_Ingrediences_Speed ()
{
	AI_Output (other,self ,"DIA_Neoras_Ingrediences_Speed_15_00"); //Welche Zutaten brauche ich für einen Trank der Geschwindigkeit?
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Speed_01_01"); //Für einen Trank, der dich schneller macht, brauche ich fünfmal so genanntes Snapperkraut und einen Kronstöckel.
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Speed_01_02"); //Und vergiss das Gold nicht.
};

FUNC VOID DIA_Neoras_Ingrediences_Mana ()
{
	AI_Output (other,self ,"DIA_Neoras_Ingrediences_Mana_15_00"); //Welche Zutaten brauche ich für ein Mana-Extrakt?
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Mana_01_01"); //Ein Manatrank ist nicht wirklich kompliziert.
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Mana_01_02"); //Du musst mir fünfmal Feuerkraut und einen Feldknöterich bringen.
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Mana_01_03"); //Und vergiss das Gold nicht.
};

FUNC VOID DIA_Neoras_Ingrediences_Health ()
{
	AI_Output (other,self ,"DIA_Neoras_Ingrediences_Health_15_00"); //Welche Zutaten brauche ich für ein Extrakt der Heilung?
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Health_01_01"); //So ein Trank ist nicht besonders kompliziert.
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Health_01_02"); //Du musst mir nur fünf Heilkräuter und einen Feldknöterich bringen.
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Health_01_03"); //Und vergiss das Gold nicht.
};
*/
///////////////////////////////////////////////////////////////////////
//	Braue mir einen Trank //Ist Perm für KAp 3,4 und 5!!
///////////////////////////////////////////////////////////////////////

INSTANCE DIA_Neoras_BrewForMe   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 39;
	condition   = DIA_Neoras_BrewForMe_Condition;
	information = DIA_Neoras_BrewForMe_Info;
	permanent   = TRUE;
	description = "Namíchej mi...";
};
FUNC INT DIA_Neoras_BrewForMe_Condition()
{
	if (NeorasBrewsForYou == TRUE)
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Neoras_BrewForMe_Info()
{
	Info_ClearChoices (DIA_Neoras_BrewForMe);
	Info_AddChoice (DIA_Neoras_BrewForMe,DIALOG_BACK,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice (DIA_Neoras_BrewForMe,"Lektvar rychlosti.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice (DIA_Neoras_BrewForMe,"Extrakt many.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice (DIA_Neoras_BrewForMe,"Extrakt hojivé síly.",DIA_Neoras_BrewForMe_Health);
};

FUNC VOID DIA_Neoras_BrewForMe_Back ()
{
	Info_ClearChoices (DIA_Neoras_BrewForMe);
};

FUNC VOID DIA_Neoras_BrewForMe_Speed ()
{
	AI_Output (other,self ,"DIA_Neoras_BrewForMe_Speed_15_00"); //Namíchej mi lektvar rychlosti.
	AI_Output (self ,other,"DIA_Neoras_BrewForMe_Speed_01_01"); //Dobrá, máš potâebné ingredience a peníze?
	
	if (Npc_HasItems (other,ItPl_Speed_Herb_01) >= 1)
	&& (Npc_HasItems (other,ItPl_Temp_Herb) >= 1)
	&& (Npc_HasItems (other,ItMi_Gold) >= 10)
	{
		AI_Output (other,self ,"DIA_Neoras_BrewForMe_Speed_15_02"); //Ano, tady.
		
		B_GiveInvItems (other,self,ItPl_Speed_Herb_01,1);
		B_GiveInvItems (other,self,ItPl_Temp_Herb,1);
		B_GiveInvItems (other,self,ItMi_Gold,10);
		
		AI_Output (self ,other,"DIA_Neoras_BrewForMe_Speed_01_03"); //Dobrá, dękuji. Dám ti ten lektvar hned, abys nemusel čekat.
	
		B_GiveInvItems (self,other,ItPo_Speed,1);
	}
	else
	{
		AI_Output (self ,other,"DIA_Neoras_BrewForMe_Speed_01_04"); //Nemáš všechny potâebné ingredience. Vraă se, až je budeš mít.
	}; 
	
	Info_ClearChoices (DIA_Neoras_BrewForMe);
	Info_AddChoice (DIA_Neoras_BrewForMe,DIALOG_BACK,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice (DIA_Neoras_BrewForMe,"Namíchej mi lektvar vysoké rychlosti.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice (DIA_Neoras_BrewForMe,"Namíchej mi výtažek many.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice (DIA_Neoras_BrewForMe,"Namíchej mi léčivý elixír.",DIA_Neoras_BrewForMe_Health);
};

FUNC VOID DIA_Neoras_BrewForMe_Mana ()
{
	AI_Output (other,self ,"DIA_Neoras_BrewForMe_Mana_15_00"); //Namíchej mi výtažek many.
	AI_Output (self ,other,"DIA_Neoras_BrewForMe_Mana_01_01"); //Dobrá, máš potâebné ingredience a peníze?
	
	if (Npc_HasItems (other,ItPl_Mana_Herb_02) >= 2)
	&& (Npc_HasItems (other,ItPl_Temp_Herb) >= 1)
	&& (Npc_HasItems (other,ItMi_Gold) >= 10)
	{
		AI_Output (other,self ,"DIA_Neoras_BrewForMe_Mana_15_02"); //Ano, tady.
		
		B_GiveInvItems (other,self,ItPl_Mana_Herb_02,2);
		B_GiveInvItems (other,self,ItPl_Temp_Herb,1);
		B_GiveInvItems (other,self,ItMi_Gold,10);
		
		AI_Output (self ,other,"DIA_Neoras_BrewForMe_Mana_01_03"); //Dobrá, dękuji. Dám ti ten lektvar hned, abys nemusel čekat.
	
		B_GiveInvItems (self,other,ItPo_Mana_02,1);
	}
	else
	{
		AI_Output (self ,other,"DIA_Neoras_BrewForMe_Mana_01_04"); //Nemáš všechny potâebné ingredience. Vraă se, až je budeš mít.
	}; 
	
	Info_ClearChoices (DIA_Neoras_BrewForMe);
	Info_AddChoice (DIA_Neoras_BrewForMe,DIALOG_BACK,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice (DIA_Neoras_BrewForMe,"Namíchej mi lektvar vysoké rychlosti.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice (DIA_Neoras_BrewForMe,"Namíchej mi výtažek many.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice (DIA_Neoras_BrewForMe,"Namíchej mi léčivý elixír.",DIA_Neoras_BrewForMe_Health);
};

FUNC VOID DIA_Neoras_BrewForMe_Health ()
{
	AI_Output (other,self ,"DIA_Neoras_BrewForMe_Health_15_00"); //Namíchej mi léčivý elixír.
	AI_Output (self ,other,"DIA_Neoras_BrewForMe_Health_01_01"); //Dobrá, máš potâebné ingredience a peníze?
	
	if (Npc_HasItems (other,ItPl_Health_Herb_02) >= 2)
	&& (Npc_HasItems (other,ItPl_Temp_Herb) >= 1)
	&& (Npc_HasItems (other,ItMi_Gold) >= 10)
	{
		AI_Output (other,self ,"DIA_Neoras_BrewForMe_Health_15_02"); //Ano, tady.
		
		B_GiveInvItems (other,self,ItPl_Health_Herb_02,2);
		B_GiveInvItems (other,self,ItPl_Temp_Herb,1);
		B_GiveInvItems (other,self,ItMi_Gold,10);
		
		AI_Output (self ,other,"DIA_Neoras_BrewForMe_Health_01_03"); //Dobrá, dękuji. Dám ti ten lektvar hned, abys nemusel čekat.
	
		B_GiveInvItems (self,other,ItPo_Health_02,1);
	}
	else
	{
		AI_Output (self ,other,"DIA_Neoras_BrewForMe_Health_01_04"); //Nemáš všechny potâebné ingredience. Vraă se, až je budeš mít.
	}; 
	
	Info_ClearChoices (DIA_Neoras_BrewForMe);
	Info_AddChoice (DIA_Neoras_BrewForMe,DIALOG_BACK,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice (DIA_Neoras_BrewForMe,"Namíchej mi lektvar vysoké rychlosti.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice (DIA_Neoras_BrewForMe,"Namíchej mi výtažek many.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice (DIA_Neoras_BrewForMe,"Namíchej mi léčivý elixír.",DIA_Neoras_BrewForMe_Health);
};

//#####################################################################
//##
//##	Kapitel 4
//##
//#####################################################################
 
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Kap4_EXIT   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 999;
	condition   = DIA_Neoras_Kap4_EXIT_Condition;
	information = DIA_Neoras_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Neoras_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Neoras_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Dracheneier
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_DRACHENEIER		(C_INFO)
{
	npc		 = 	KDF_506_Neoras;
	nr		 = 	40;
	condition	 = 	DIA_Neoras_DRACHENEIER_Condition;
	information	 = 	DIA_Neoras_DRACHENEIER_Info;
	permanent	 = 	TRUE;

	description	 = 	"Zdá se, že tvrdę pracuješ.";
};

func int DIA_Neoras_DRACHENEIER_Condition ()
{
	if 	(Kapitel >= 4)
	&& 	((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)	|| (hero.guild == GIL_KDF))
	&&  (MIS_Neoras_DragonEgg == 0)
		{
				return TRUE;
		};
};

func void DIA_Neoras_DRACHENEIER_Info ()
{
	AI_Output			(other, self, "DIA_Neoras_DRACHENEIER_15_00"); //Zdá se, že tvrdę pracuješ.
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_01_01"); //Ano, jsem naprosto vyčerpaný. Už nękolik dní se snažím zjistit, jak má tahle zatracená smęs fungovat, ale vůbec mi to nejde.

	Info_ClearChoices	(DIA_Neoras_DRACHENEIER);
	Info_AddChoice	(DIA_Neoras_DRACHENEIER, "To není můj problém.", DIA_Neoras_DRACHENEIER_no );
	Info_AddChoice	(DIA_Neoras_DRACHENEIER, "Jaký lektvar to má být?", DIA_Neoras_DRACHENEIER_trank );
	Info_AddChoice	(DIA_Neoras_DRACHENEIER, "V čem je problém?", DIA_Neoras_DRACHENEIER_ei );

};
func void DIA_Neoras_DRACHENEIER_ei ()
{
	AI_Output			(other, self, "DIA_Neoras_DRACHENEIER_ei_15_00"); //V čem je problém?
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_ei_01_01"); //V receptu stojí nęco o dračím vejci. Já ale žádné samozâejmę nemám.
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_ei_01_02"); //Snažil jsem se tedy tu pâísadu nęčím nahradit. Zatím ovšem jen s pramalým úspęchem.
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_ei_01_03"); //Kdybys náhodou na nęjaké to vejce pâi svých cestách narazil, vzpomeŕ si na mę.

	Info_AddChoice	(DIA_Neoras_DRACHENEIER, "A co tedy používáš místo dračího vejce?", DIA_Neoras_DRACHENEIER_ei_statt );
	Info_AddChoice	(DIA_Neoras_DRACHENEIER, "Uvidím, co se dá dęlat.", DIA_Neoras_DRACHENEIER_ei_jep );

};
func void DIA_Neoras_DRACHENEIER_ei_jep ()
{
	AI_Output			(other, self, "DIA_Neoras_DRACHENEIER_ei_jep_15_00"); //Uvidím, co se dá dęlat.
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_ei_jep_01_01"); //Hej. To byl jenom vtip. Nevęâím, že bys nęjaké dračí vejce opravdu našel.
	AI_Output			(other, self, "DIA_Neoras_DRACHENEIER_ei_jep_15_02"); //Jen počkej.
	Info_ClearChoices	(DIA_Neoras_DRACHENEIER);
	
	Log_CreateTopic (TOPIC_DRACHENEIERNeoras, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENEIERNeoras, LOG_RUNNING);
	B_LogEntry (TOPIC_DRACHENEIERNeoras,"Neoras potâebuje pro své experimenty dračí vejce. Domnívá se, že bych nęjaké mohl najít kdesi v jeskyni."); 

	MIS_Neoras_DragonEgg = LOG_RUNNING;
};

func void DIA_Neoras_DRACHENEIER_ei_statt ()
{
	AI_Output			(other, self, "DIA_Neoras_DRACHENEIER_ei_statt_15_00"); //A co tedy používáš místo dračího vejce?
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_ei_statt_01_01"); //Vęâ mi, nechtęl bys to vędęt.
};

func void DIA_Neoras_DRACHENEIER_trank ()
{
	AI_Output			(other, self, "DIA_Neoras_DRACHENEIER_trank_15_00"); //Co to má být za lektvar?
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_trank_01_01"); //Koupil jsem ten recept od jednoho potulného kupce. Stojí v nęm nękolik podivných, ale docela zajímavých vęcí.
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_trank_01_02"); //Nevím, jestli ten lektvar bude skutečnę nęco dęlat, ale moje touha po poznání mę neustále nutí to zkoušet.
};

func void DIA_Neoras_DRACHENEIER_no ()
{
	AI_Output			(other, self, "DIA_Neoras_DRACHENEIER_no_15_00"); //To není můj problém.
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_no_01_01"); //V tom pâípadę mę už dál neobtęžuj.
	Info_ClearChoices	(DIA_Neoras_DRACHENEIER);
};


///////////////////////////////////////////////////////////////////////
//	Info FoundDragonEgg
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_FOUNDDRAGONEGG		(C_INFO)
{
	npc		 = 	KDF_506_Neoras;
	nr		 = 	3;
	condition	 = 	DIA_Neoras_FOUNDDRAGONEGG_Condition;
	information	 = 	DIA_Neoras_FOUNDDRAGONEGG_Info;

	description	 = 	"Mám pro tebe to dračí vejce.";
};

func int DIA_Neoras_FOUNDDRAGONEGG_Condition ()
{
	if (Npc_HasItems (other,ItAt_DragonEgg_Mis))
	&& (MIS_Neoras_DragonEgg == LOG_RUNNING)
		{
				return TRUE;
		};
};
var int Neoras_DragonEggDrink_Day;
func void DIA_Neoras_FOUNDDRAGONEGG_Info ()
{
	AI_Output			(other, self, "DIA_Neoras_FOUNDDRAGONEGG_15_00"); //Mám pro tebe to dračí vejce.
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_01_01"); //Dęláš si ze mę legraci.
	B_GiveInvItems 		(other, self, ItAt_DragonEgg_Mis,1);
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_01_02"); //Je pravé! Netušil jsem, že by to mohlo být možné. Kdes ho našel?
	AI_Output			(other, self, "DIA_Neoras_FOUNDDRAGONEGG_15_03"); //Radši bych si to nechal pro sebe.
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_01_04"); //Výbornę. Co za nęj chceš?
	
	MIS_Neoras_DragonEgg = LOG_SUCCESS;
	B_GivePlayerXP (XP_Neoras_DragonEgg);

	Info_ClearChoices	(DIA_Neoras_FOUNDDRAGONEGG);
	Info_AddChoice	(DIA_Neoras_FOUNDDRAGONEGG, "Pâekvap mę.", DIA_Neoras_FOUNDDRAGONEGG_irgendwas );
	Info_AddChoice	(DIA_Neoras_FOUNDDRAGONEGG, "Co takhle pár léčivých lektvarů?", DIA_Neoras_FOUNDDRAGONEGG_heil );
	Info_AddChoice	(DIA_Neoras_FOUNDDRAGONEGG, "Až budeš mít ten lektvar hotový, trochu mi ho dej.", DIA_Neoras_FOUNDDRAGONEGG_trank );
};

var int Neoras_SCWantsDragonEggDrink;
func void DIA_Neoras_FOUNDDRAGONEGG_trank ()
{
	AI_Output			(other, self, "DIA_Neoras_FOUNDDRAGONEGG_trank_15_00"); //Až budeš mít ten lektvar hotový, trochu mi ho dej.
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_trank_01_01"); //Dobrá. Ale jak jsem âekl, nemám tušení, co z toho nakonec vyjde.
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_trank_01_02"); //Stav se pozdęji, až ho budu mít hotový.

	Neoras_DragonEggDrink_Day = Wld_GetDay(); 
	Neoras_SCWantsDragonEggDrink = TRUE;
	Info_ClearChoices	(DIA_Neoras_FOUNDDRAGONEGG);
};

func void DIA_Neoras_FOUNDDRAGONEGG_heil ()
{
	AI_Output			(other, self, "DIA_Neoras_FOUNDDRAGONEGG_heil_15_00"); //Co takhle pár léčivých lektvarů?
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_heil_01_01"); //Dobrá volba. Na, vezmi si je. Snad se ti budou hodit.

	CreateInvItems 		(self, ItPo_Health_03, 3);									
	B_GiveInvItems 		(self, other, ItPo_Health_03, 3);					
	Info_ClearChoices	(DIA_Neoras_FOUNDDRAGONEGG);

};

func void DIA_Neoras_FOUNDDRAGONEGG_irgendwas ()
{
	AI_Output			(other, self, "DIA_Neoras_FOUNDDRAGONEGG_irgendwas_15_00"); //Pâekvap mę.
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_01"); //Hmm. Dobrá. Tak si vezmi tenhle magický prsten. Určitę ti pomůže, až budeš čelit nepâátelské pâesile.
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_02"); //Ochrání tę pâed útoky magických stvoâení.

	CreateInvItems 		(self, ItRi_Prot_Mage_02, 1);									
	B_GiveInvItems 		(self, other, ItRi_Prot_Mage_02, 1);
						
	Info_ClearChoices	(DIA_Neoras_FOUNDDRAGONEGG);
};

///////////////////////////////////////////////////////////////////////
//	Info DragonEggDrink
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_DRAGONEGGDRINK		(C_INFO)
{
	npc		 = 	KDF_506_Neoras;
	nr		 = 	3;
	condition	 = 	DIA_Neoras_DRAGONEGGDRINK_Condition;
	information	 = 	DIA_Neoras_DRAGONEGGDRINK_Info;

	description	 = 	"Pâišel jsem si pro ten hrozný lektvar z dračího vejce.";
};

func int DIA_Neoras_DRAGONEGGDRINK_Condition ()
{
	if (Neoras_DragonEggDrink_Day <=(Wld_GetDay()-2))
	&& (Neoras_SCWantsDragonEggDrink == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Neoras_DRAGONEGGDRINK_Info ()
{
	AI_Output			(other, self, "DIA_Neoras_DRAGONEGGDRINK_15_00"); //Pâišel jsem si pro ten hrozný lektvar z dračího vejce.
	AI_Output			(self, other, "DIA_Neoras_DRAGONEGGDRINK_01_01"); //Ano. Právę jsem ho dodęlal. Ale poslouchej, ještę jsem ho nezkoušel a nepâijímám žádnou zodpovędnost za následky.
	AI_Output			(other, self, "DIA_Neoras_DRAGONEGGDRINK_15_02"); //Tak už mi ho dej.
	AI_Output			(self, other, "DIA_Neoras_DRAGONEGGDRINK_01_03"); //Dobrá. Doufám, že ti po nęm nevybouchne hlava.
	CreateInvItems 		(self, ItPo_DragonEggDrinkNeoras_MIS, 1);									
	B_GiveInvItems 		(self, other, ItPo_DragonEggDrinkNeoras_MIS, 1);					
};

///////////////////////////////////////////////////////////////////////
//	Info UsedDragonEggDrink
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_USEDDRAGONEGGDRINK		(C_INFO)
{
	npc		 = 	KDF_506_Neoras;
	nr		 = 	3;
	condition	 = 	DIA_Neoras_USEDDRAGONEGGDRINK_Condition;
	information	 = 	DIA_Neoras_USEDDRAGONEGGDRINK_Info;

	description	 = 	"Vyzkoušel jsem ten tvůj vývar z dračího vejce. Je to síla!";
};

func int DIA_Neoras_USEDDRAGONEGGDRINK_Condition ()
{
	if (Neoras_SCUsedDragonEggDrink == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Neoras_USEDDRAGONEGGDRINK_Info ()
{
	AI_Output			(other, self, "DIA_Neoras_USEDDRAGONEGGDRINK_15_00"); //Zkoušel jsem tu smęs z dračího vejce. Vážnę výborná vęc!
	AI_Output			(self, other, "DIA_Neoras_USEDDRAGONEGGDRINK_01_01"); //Hmm. Velice zajímavé. Rozhodnę musím ve svém výzkumu pokračovat.
	AI_Output			(other, self, "DIA_Neoras_USEDDRAGONEGGDRINK_15_02"); //Mohl bys toho udęlat trochu víc?
	AI_Output			(self, other, "DIA_Neoras_USEDDRAGONEGGDRINK_01_03"); //Lepší bude, když to zkusíme zase až za pár týdnů. Jinak by ti nejspíš narostly rohy.
};

//#####################################################################
//##
//##	Kapitel 5
//##
//#####################################################################
 
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Kap5_EXIT   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 999;
	condition   = DIA_Neoras_Kap5_EXIT_Condition;
	information = DIA_Neoras_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Neoras_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Neoras_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Neoras_PICKPOCKET (C_INFO)
{
	npc			= KDF_506_Neoras;
	nr			= 900;
	condition	= DIA_Neoras_PICKPOCKET_Condition;
	information	= DIA_Neoras_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Neoras_PICKPOCKET_Condition()
{
	C_Beklauen (72, 140);
};
 
FUNC VOID DIA_Neoras_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Neoras_PICKPOCKET);
	Info_AddChoice		(DIA_Neoras_PICKPOCKET, DIALOG_BACK 		,DIA_Neoras_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Neoras_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Neoras_PICKPOCKET_DoIt);
};

func void DIA_Neoras_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Neoras_PICKPOCKET);
};
	
func void DIA_Neoras_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Neoras_PICKPOCKET);
};
























