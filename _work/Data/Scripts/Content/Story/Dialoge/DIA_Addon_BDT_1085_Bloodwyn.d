//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Bloodwyn_EXIT   (C_INFO)
{
	npc         = BDT_1085_Addon_Bloodwyn;
	nr          = 999;
	condition   = DIA_Addon_Bloodwyn_EXIT_Condition;
	information = DIA_Addon_Bloodwyn_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Bloodwyn_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Bloodwyn_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Bloodwyn_PICKPOCKET (C_INFO)
{
	npc			= BDT_1085_Addon_Bloodwyn;
	nr			= 900;
	condition	= DIA_Addon_Bloodwyn_PICKPOCKET_Condition;
	information	= DIA_Addon_Bloodwyn_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Addon_Bloodwyn_PICKPOCKET_Condition()
{
	C_Beklauen (90, 250);
};
 
FUNC VOID DIA_Addon_Bloodwyn_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Bloodwyn_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Bloodwyn_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Bloodwyn_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Bloodwyn_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Bloodwyn_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bloodwyn_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Bloodwyn_PICKPOCKET);
};
	
func void DIA_Addon_Bloodwyn_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Bloodwyn_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Dead
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Bloodwyn_Dead   (C_INFO)
{
	npc         = BDT_1085_Addon_Bloodwyn;
	nr          = 2;
	condition   = DIA_Addon_Bloodwyn_Dead_Condition;
	information = DIA_Addon_Bloodwyn_Dead_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Bloodwyn_Dead_Condition()
{	
	if (Npc_GetDistToWP (self, "BL_RAVEN_09") <= 1000)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bloodwyn_Dead_Info()
{
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Dead_04_00");//Hé, comment êtes-vous entré ici ?
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Dead_15_01");//Par l'entrée...
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Dead_04_02");//Amusant... je déteste les blagues.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};
//------------------------------------------------------------------------------
FUNC VOID Bloodwyn_Choices_1() 
{
	Info_ClearChoices (DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,"Et moi qui pensais vous avoir démasqué...",DIA_Addon_Bloodwyn_Wait_GOOD1);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,"Tout a une fin...",DIA_Addon_Bloodwyn_Wait_BAD1);
};
FUNC VOID Bloodwyn_Choices_2() 
{
	
	Info_ClearChoices (DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,"Et selon vous, qui a bien pu détruire la Barrière ?",DIA_Addon_Bloodwyn_Wait_GOOD2);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,"Vous et bien d'autres personnes...",DIA_Addon_Bloodwyn_Wait_BAD2);
};
FUNC VOID Bloodwyn_Choices_3() 
{
	Info_ClearChoices (DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,"Apparemment, il n'avait pas le temps de faire dans le détail...",DIA_Addon_Bloodwyn_Wait_GOOD3);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,"Oui... ç'aura été sa plus grosse erreur.",DIA_Addon_Bloodwyn_Wait_BAD3);
};
//---------------------------------------------------------------------
//	Info Wait
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Bloodwyn_Wait   (C_INFO)
{
	npc         = BDT_1085_Addon_Bloodwyn;
	nr          = 2;
	condition   = DIA_Addon_Bloodwyn_Wait_Condition;
	information = DIA_Addon_Bloodwyn_Wait_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Bloodwyn_Wait_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (MineCrawler_Killed >= 9)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bloodwyn_Wait_Info()
{
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wait_04_00");//Vous avez tué les foreurs dans la mine. Bien. Je prends le relais, maintenant. Maintenant, dégagez.
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_15_01");//Attendez une seconde.
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wait_04_02");//Vous êtes toujours là ?

	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_15_03");//Il nous reste un point à régler.
	
	Info_ClearChoices (DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,"Je recherche Raven.",DIA_Addon_Bloodwyn_Wait_Raven);
};
FUNC VOID DIA_Addon_Bloodwyn_Wait_Raven()
{
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_15_00");//Je recherche Raven.
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wait_Raven_04_01");//Ouais - et qu'est-ce qui vous fait que croire Raven a l'intention de vous parler, de toutes... attendez un peu, vous êtes... C'est VOUS ?!
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wait_Raven_04_02");//Vous êtes le type qu'on recherche depuis le début. Qu'est-ce que vous faites ici ? Vous devriez être mort depuis longtemps !
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_15_03");//Ça, tout le monde me le répète sans cesse.
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wait_Raven_04_04");//Ces crétins ont tous échoué - mais cette fois, vous n'en réchapperez pas. Cette fois, je vais en finir avec vous !
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_15_05");//Comme je vous l'ai déjà dit - c'est Raven que je recherche. Vous êtes sans importance à mes yeux.
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wait_Raven_04_06");//Je vous tuerai - j'ai survécu à tous mes combats, jusqu'à aujourd'hui.
	
	Bloodwyn_Choices_1() ;
	
}; 
FUNC VOID DIA_Addon_Bloodwyn_Wait_FIGHT()
{
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_15_00");//Assez parlé. Battons-nous !
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_04_01");//(triomphant) De toutes façons, vous arrivez trop tard ! Raven ouvre le temple en ce moment même ! Hahaha ! C'est la fin pour vous, ordure !
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};

FUNC VOID Bloodwyn_Lach()
{
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Lach_04_00");//HAHAHA - je vous écraserai de toutes façons !
};
FUNC VOID Bloodwyn_Wut()
{
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wut_04_00");//AARGH ! Chien galeux !
	
	self.attribute[ATR_STRENGTH]	  = self.attribute[ATR_STRENGTH] 		-  5;
	self.attribute[ATR_HITPOINTS]	  = self.attribute[ATR_HITPOINTS] 		-  25;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] 	-  25;
};
FUNC VOID Bloodwyn_Next_1()
{
	AI_Output (self, other, "DIA_Addon_Bloodwyn_SayChoice_2_04_00");//Et j'ai survécu à l'explosion de la Barrière sans même une éraflure !
};
FUNC VOID Bloodwyn_Next_2()
{
	AI_Output (self, other, "DIA_Addon_Bloodwyn_SayChoice_3_04_00");//Vous ne pouvez me vaincre ! Je suis l'ami de Raven, son bras droit !
};
//------------------------------------------------------------------------------
FUNC VOID DIA_Addon_Bloodwyn_Wait_GOOD1()
{
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_GOOD1_15_00");//Et moi qui croyais vous avoir fait mordre la poussière...
	Bloodwyn_Wut();
	Bloodwyn_Next_1();
	
	Bloodwyn_Choices_2(); 
};

FUNC VOID DIA_Addon_Bloodwyn_Wait_BAD1()
{
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_BAD1_15_00");//Tout a une fin...
	Bloodwyn_Lach();
	Bloodwyn_Next_1();
	

	Bloodwyn_Choices_2(); 
};
//------------------------------------------------------------------------------
FUNC VOID DIA_Addon_Bloodwyn_Wait_GOOD2()
{
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_GOOD2_15_00");//Et selon vous, qui a bien pu détruire la Barrière ?
	Bloodwyn_Wut();
	Bloodwyn_Next_2();
	

	Bloodwyn_Choices_3(); 
};

FUNC VOID DIA_Addon_Bloodwyn_Wait_BAD2()
{
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_BAD2_15_00");//Vous et plein d'autres types, aussi...
	Bloodwyn_Lach();
	Bloodwyn_Next_2();
	

	Bloodwyn_Choices_3();
};
//------------------------------------------------------------------------------
FUNC VOID DIA_Addon_Bloodwyn_Wait_GOOD3()
{

	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_GOOD3_15_00");//Apparemment, il n'avait pas le temps de se montrer difficile...
	Bloodwyn_Wut();
	Info_ClearChoices (DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
};

FUNC VOID DIA_Addon_Bloodwyn_Wait_BAD3()
{

	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_BAD3_15_00");//Oui, ç'aura été sa plus grosse erreur...
	Bloodwyn_Wut();
	Info_ClearChoices (DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
};











	
	
	
	
	
	
	
	
	
	
	
		
	


