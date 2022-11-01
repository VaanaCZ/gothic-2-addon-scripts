///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Albrecht_EXIT   (C_INFO)
{
	npc         = PAL_202_Albrecht;
	nr          = 999;
	condition   = DIA_Albrecht_EXIT_Condition;
	information = DIA_Albrecht_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Albrecht_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Albrecht_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hagen
///////////////////////////////////////////////////////////////////////
instance DIA_Albrecht_Hagen		(C_INFO)
{
	npc		 	 = 	PAL_202_Albrecht;
	nr			 =  1;
	condition	 = 	DIA_Albrecht_Hagen_Condition;
	information	 = 	DIA_Albrecht_Hagen_Info;
	permanent    =  FALSE;
	description	 =  "Devo parlare con Lord Hagen!";
};

func int DIA_Albrecht_Hagen_Condition ()
{	
	if (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Albrecht_Hagen_Info ()
{
	AI_Output (other, self, "DIA_Albrecht_Hagen_15_00"); //Devo parlare con Lord Hagen!
	AI_Output (self, other, "DIA_Albrecht_Hagen_03_01"); //È nel salone, dritto da questa parte.
	AI_Output (self, other, "DIA_Albrecht_Hagen_03_02"); //Qualsiasi cosa tu voglia da lui, fai in fretta, è un uomo molto impegnato!
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Albrecht_Hallo		(C_INFO)
{
	npc		 	 = 	PAL_202_Albrecht;
	nr			 =  2;
	condition	 = 	DIA_Albrecht_Hallo_Condition;
	information	 = 	DIA_Albrecht_Hallo_Info;
	permanent    =  FALSE;
	description	 =  "Cosa significa essere un paladino?";
};

func int DIA_Albrecht_Hallo_Condition ()
{	
	return TRUE;
};
func void DIA_Albrecht_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Albrecht_Hallo_15_00"); //Cosa significa essere un paladino?
	AI_Output (self, other, "DIA_Albrecht_Hallo_03_01"); //Un paladino è un guerriero di Innos. Vive per servirlo e combatte per onorarlo.
	AI_Output (self, other, "DIA_Albrecht_Hallo_03_02"); //In cambio ci è concesso il dono della magia. La magia delle rune, le quali ci vengono offerte come ricompensa per le nostre gesta.
};
///////////////////////////////////////////////////////////////////////
//	Info CanTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Albrecht_CanTeach		(C_INFO)
{
	npc		 	 = 	PAL_202_Albrecht;
	nr			 =  99;
	condition	 = 	DIA_Albrecht_CanTeach_Condition;
	information	 = 	DIA_Albrecht_CanTeach_Info;
	permanent    =  TRUE;
	description	 = 	"Puoi insegnarmi qualcosa?";
};

func int DIA_Albrecht_CanTeach_Condition ()
{	
	if  (Albrecht_TeachMANA == FALSE)
	{	
		return TRUE;
	};
};
func void DIA_Albrecht_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Albrecht_CanTeach_15_00"); //Puoi insegnarmi qualcosa?
	
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Albrecht_CanTeach_03_01"); //Se ti dimostrerai degno ti conferirò le magiche rune dei paladini.
		AI_Output (self, other, "DIA_Albrecht_CanTeach_03_02"); //Oltre a questo, posso insegnarti ad aumentare il tuo potere magico.
		Albrecht_TeachMANA = TRUE;
		B_LogEntry (TOPIC_CityTeacher,"Il paladino Albrecht può aiutarmi a incrementare i miei poteri magici.");
	}
	else
	{	
		AI_Output (self, other, "DIA_Albrecht_CanTeach_03_03"); //Istruisco solamente i paladini.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TEACHPalRunes
///////////////////////////////////////////////////////////////////////
instance DIA_Albrecht_TEACHPalRunes		(C_INFO)
{
	npc		  	 = 	PAL_202_Albrecht;
	nr			 = 	100;
	condition	 = 	DIA_Albrecht_TEACHPalRunes_Condition;
	information	 = 	DIA_Albrecht_TEACHPalRunes_Info;
	permanent	 = 	TRUE;
	description	 = 	"Merito di ricevere una runa?";
};
func int DIA_Albrecht_TEACHPalRunes_Condition ()
{	
	if (Albrecht_TeachMANA == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Albrecht_TEACHPalRunes_Info ()
{
	AI_Output (other, self, "DIA_Albrecht_TEACHPalRunes_15_00"); //Merito di ricevere una runa?
	
	if (PLAYER_TALENT_RUNES [SPL_PalLight] == FALSE)
	{
		
		AI_Output (self,other, "DIA_Albrecht_TEACHPalRunes_03_01"); //Come segno del tuo rango, ti concedo la Runa della Luce. È un simbolo di verità e giustizia.
		AI_Output (self,other, "DIA_Albrecht_TEACHPalRunes_03_02"); //Illumina la via per tutti coloro che percorrono la via di Innos.
		AI_Output (self,other, "DIA_Albrecht_TEACHPalRunes_03_03"); //Dovrai guadagnarti le altre rune. Torna quando penserai di esserti dimostrato degno.
	
		PLAYER_TALENT_RUNES [SPL_PalLight] = TRUE;
	
		CreateInvItems (self,ItRu_PalLight,1);
		B_GiveInvItems (self,other,ItRu_PalLight,1);
	}
	else
	{
		AI_Output (self,other, "DIA_Albrecht_TEACHPalRunes_03_04"); //Quale via hai scelto?
		AI_Output (self,other, "DIA_Albrecht_TEACHPalRunes_03_05"); //La via della guarigione o la via della battaglia?
		
		Info_ClearChoices   (DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice (DIA_Albrecht_TEACHPalRunes,DIALOG_BACK,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice (DIA_Albrecht_TEACHPalRunes,"Scelgo il percorso curativo.",DIA_Albrecht_TEACHPalRunes_Heal);
		Info_AddChoice (DIA_Albrecht_TEACHPalRunes,"Scelgo il percorso del combattimento.",DIA_Albrecht_TEACHPalRunes_Combat);
	};	
};

FUNC VOID DIA_Albrecht_TEACHPalRunes_BACK()
{
	Info_ClearChoices   (DIA_Albrecht_TEACHPalRunes);
};

FUNC VOID B_Albrecht_YouAreNotWorthy ()
{
	AI_Output (self ,other,"B_Albrecht_YouAreNotWorthy_03_00"); //Non sei ancora degno di ricevere il prossimo incantesimo per questa via.
};

FUNC VOID DIA_Albrecht_TEACHPalRunes_Heal()
{
	AI_Output (other,self ,"DIA_Albrecht_TEACHPalRunes_Heal_15_00"); //Scelgo il percorso curativo.
	if  (PLAYER_TALENT_RUNES [SPL_PalLightHeal] == FALSE)
	&&	(MIS_ReadyforChapter4 == TRUE)
	{
		Info_ClearChoices   (DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice (DIA_Albrecht_TEACHPalRunes,DIALOG_BACK,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice	(DIA_Albrecht_TEACHPalRunes, B_BuildLearnString ("Cura ferite leggere", CostForPalSpells) ,DIA_Albrecht_TEACHPalRunes_PalLightHeal);
	}
	else if 	(PLAYER_TALENT_RUNES [SPL_PalMediumHeal] == FALSE)
	&&	(Kapitel >= 5)
	{
		Info_ClearChoices   (DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice (DIA_Albrecht_TEACHPalRunes,DIALOG_BACK,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice	(DIA_Albrecht_TEACHPalRunes, B_BuildLearnString ("Cura ferite medie", CostForPalSpells) ,DIA_Albrecht_TEACHPalRunes_PalMediumHeal);
	}
	else
	{
		B_Albrecht_YouAreNotWorthy ();
	};
};

FUNC VOID DIA_Albrecht_TEACHPalRunes_Combat()
{
	AI_Output (other,self ,"DIA_Albrecht_TEACHPalRunes_Combat_15_00"); //Scelgo il percorso del combattimento.
	
	if	(PLAYER_TALENT_RUNES [SPL_PalHolyBolt] == FALSE)
	&&	(MIS_ReadyforChapter4 == TRUE)
	{
		Info_ClearChoices   (DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice (DIA_Albrecht_TEACHPalRunes,DIALOG_BACK,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice	(DIA_Albrecht_TEACHPalRunes, B_BuildLearnString ("Freccia sacra", CostForPalSpells) ,DIA_Albrecht_TEACHPalRunes_PalHolyBolt);
	}
	else if (PLAYER_TALENT_RUNES [SPL_PalRepelEvil] == FALSE)
	&&	(Kapitel >= 5)
	{
		Info_ClearChoices   (DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice (DIA_Albrecht_TEACHPalRunes,DIALOG_BACK,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice	(DIA_Albrecht_TEACHPalRunes, B_BuildLearnString ("Scaccia il male", CostForPalSpells) ,DIA_Albrecht_TEACHPalRunes_PalRepelEvil);
	}
	else
	{
		B_Albrecht_YouAreNotWorthy ();
	};
};


FUNC INT DIA_Albrecht_TEACHPalRunes_PalLightHeal()
{
	if (other.lp < CostForPalSpells)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	
	PLAYER_TALENT_RUNES [SPL_PalLightHeal] = TRUE;
	CreateInvItems (self,ItRu_PalLightHeal,1);
	B_GiveInvItems (self,other,ItRu_PalLightHeal,1);
	other.lp = (other.lp -CostForPalSpells);
	Info_ClearChoices   (DIA_Albrecht_TEACHPalRunes); 

	return TRUE;
};

FUNC INT DIA_Albrecht_TEACHPalRunes_PalMediumHeal()
{
	if (other.lp < CostForPalSpells)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	PLAYER_TALENT_RUNES [SPL_PalMediumHeal] = TRUE;
	CreateInvItems (self,ItRu_PalMediumHeal,1);
	B_GiveInvItems (self,other,ItRu_PalMediumHeal,1); 
	other.lp = (other.lp -CostForPalSpells);
	return TRUE;
};

FUNC INT DIA_Albrecht_TEACHPalRunes_PalHolyBolt()
{
	if (other.lp < CostForPalSpells)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	
	PLAYER_TALENT_RUNES [SPL_PalHolyBolt] = TRUE;
	CreateInvItems (self,ItRu_PalHolyBolt,1);
	B_GiveInvItems (self,other,ItRu_PalHolyBolt,1);  
	other.lp = (other.lp -CostForPalSpells);
	return TRUE;
};

FUNC INT DIA_Albrecht_TEACHPalRunes_PalRepelEvil()
{
	if (other.lp < CostForPalSpells)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	
	PLAYER_TALENT_RUNES [SPL_PalRepelEvil] = TRUE;
	CreateInvItems (self,ItRu_PalRepelEvil,1);
	B_GiveInvItems (self,other,ItRu_PalRepelEvil,1);
	other.lp = (other.lp -CostForPalSpells);
	return TRUE;
};



///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Albrecht_Teach		(C_INFO)
{
	npc		  	 = 	PAL_202_Albrecht;
	nr			 = 	101;
	condition	 = 	DIA_Albrecht_Teach_Condition;
	information	 = 	DIA_Albrecht_Teach_Info;
	permanent	 = 	TRUE;
	description	 = 	"Voglio aumentare i miei poteri magici.";
};
func int DIA_Albrecht_Teach_Condition ()
{	
	if (Albrecht_TeachMANA == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Albrecht_Teach_Info ()
{
	AI_Output (other, self, "DIA_Albrecht_Teach_15_00"); //Voglio aumentare il mio potere magico.
	
	
	Info_ClearChoices   (DIA_Albrecht_Teach);
	Info_AddChoice 		(DIA_Albrecht_Teach, DIALOG_BACK, DIA_Albrecht_Teach_BACK);
	Info_AddChoice		(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))	,DIA_Albrecht_Teach_1);
	Info_AddChoice		(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Albrecht_Teach_5);
	
};
func void DIA_Albrecht_Teach_BACK()
{
	if (other.attribute [ATR_MANA_MAX] >= T_MED)
	{
		AI_Output (self, other, "DIA_Albrecht_Teach_03_00"); //Se vuoi potenziare ulteriormente il tuo potere magico dovrai cercare un altro insegnante.
	};
	Info_ClearChoices (DIA_Albrecht_TEACH);
};
func void DIA_Albrecht_Teach_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MED);
	
	Info_ClearChoices   (DIA_Albrecht_Teach);
	
	Info_AddChoice 		(DIA_Albrecht_Teach, DIALOG_BACK, DIA_Albrecht_TEACH_BACK);
	Info_AddChoice		(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))	,DIA_Albrecht_Teach_1);
	Info_AddChoice		(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Albrecht_Teach_5);
	
	
};
func void DIA_Albrecht_Teach_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MED);
	
	Info_ClearChoices   (DIA_Albrecht_Teach);
	
	Info_AddChoice 		(DIA_Albrecht_Teach, DIALOG_BACK, DIA_Albrecht_Teach_BACK);
	Info_AddChoice		(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))	,DIA_Albrecht_Teach_1);
	Info_AddChoice		(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Albrecht_Teach_5);
	
	
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Albrecht_PICKPOCKET (C_INFO)
{
	npc			= PAL_202_Albrecht;
	nr			= 900;
	condition	= DIA_Albrecht_PICKPOCKET_Condition;
	information	= DIA_Albrecht_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Albrecht_PICKPOCKET_Condition()
{
	C_Beklauen (41, 160);
};
 
FUNC VOID DIA_Albrecht_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Albrecht_PICKPOCKET);
	Info_AddChoice		(DIA_Albrecht_PICKPOCKET, DIALOG_BACK 		,DIA_Albrecht_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Albrecht_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Albrecht_PICKPOCKET_DoIt);
};

func void DIA_Albrecht_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Albrecht_PICKPOCKET);
};
	
func void DIA_Albrecht_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Albrecht_PICKPOCKET);
};




