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
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Dead_04_00");//Hele, jak ses sem dostal?
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Dead_15_01");//Vchodem.
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Dead_04_02");//Fakt vtipný. NESNÁŠÍM vtipy.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};
//------------------------------------------------------------------------------
FUNC VOID Bloodwyn_Choices_1() 
{
	Info_ClearChoices (DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,"A já myslel, že jsem tę už jednou dostal.",DIA_Addon_Bloodwyn_Wait_GOOD1);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,"Všecko jednou končí.",DIA_Addon_Bloodwyn_Wait_BAD1);
};
FUNC VOID Bloodwyn_Choices_2() 
{
	
	Info_ClearChoices (DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,"A kdo si myslíš, že zničil bariéru?",DIA_Addon_Bloodwyn_Wait_GOOD2);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,"Ty a spousta dalších chlapů.",DIA_Addon_Bloodwyn_Wait_BAD2);
};
FUNC VOID Bloodwyn_Choices_3() 
{
	Info_ClearChoices (DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,"Očividnę si nemůže vybírat.",DIA_Addon_Bloodwyn_Wait_GOOD3);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,"Jo, to byla jeho nejvętší chyba.",DIA_Addon_Bloodwyn_Wait_BAD3);
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
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wait_04_00");//Tys pobil ty důlní červy? No dobâe, o zbytek se postarám sám. No tak, na co čekáš? Koukej, kde nechal tesaâ díru!
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_15_01");//Počkej.
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wait_04_02");//Ty ještę nejseš pryč?

	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_15_03");//Ještę si musíme nęco vyjasnit.
	
	Info_ClearChoices (DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,"Hledám Havrana.",DIA_Addon_Bloodwyn_Wait_Raven);
};
FUNC VOID DIA_Addon_Bloodwyn_Wait_Raven()
{
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_15_00");//Hledám Havrana.
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wait_Raven_04_01");//Fakt? A proč si myslíš, že by s tebou Havran chtęl mluvit... moment, TY seš... seš to TY??
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wait_Raven_04_02");//Tak tebe celou tu dobu hledám. Co tady dęláš? Dyk máš bejt dávno mrtvej!
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_15_03");//Tak tohle mi lidi âíkají poâád.
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wait_Raven_04_04");//Ti tupci to zpackali, ale pâese mę se nedostaneš. Tentokrát si to s tebou vyâídím!
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_15_05");//Jak už jsem âek – hledám Havrana, tebe nepotâebuju.
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wait_Raven_04_06");//Zabiju tę – zatím jsem pâežil každou bitvu!
	
	Bloodwyn_Choices_1() ;
	
}; 
FUNC VOID DIA_Addon_Bloodwyn_Wait_FIGHT()
{
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_15_00");//Dost âečí. Pojëme bojovat.
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_04_01");//(vítęznę) Stejnę už jdeš pozdę! Právę teë Havran otevírá chrám! Hahahaha – chcípni, grázle!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};

FUNC VOID Bloodwyn_Lach()
{
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Lach_04_00");//HAHAHA – stejnę tę zabiju!
};
FUNC VOID Bloodwyn_Wut()
{
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wut_04_00");//Aáááá! Ty mizernej pse!
	
	self.attribute[ATR_STRENGTH]	  = self.attribute[ATR_STRENGTH] 		-  5;
	self.attribute[ATR_HITPOINTS]	  = self.attribute[ATR_HITPOINTS] 		-  25;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] 	-  25;
};
FUNC VOID Bloodwyn_Next_1()
{
	AI_Output (self, other, "DIA_Addon_Bloodwyn_SayChoice_2_04_00");//Já na rozdíl od tebe pâežil výbuch bariéry bez škrábnutí!
};
FUNC VOID Bloodwyn_Next_2()
{
	AI_Output (self, other, "DIA_Addon_Bloodwyn_SayChoice_3_04_00");//Mę neporazíš, jsem Havranův nejlepší kámoš! Jeho pravá ruka!
};
//------------------------------------------------------------------------------
FUNC VOID DIA_Addon_Bloodwyn_Wait_GOOD1()
{
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_GOOD1_15_00");//A já myslel, jsem tę dostal.
	Bloodwyn_Wut();
	Bloodwyn_Next_1();
	
	Bloodwyn_Choices_2(); 
};

FUNC VOID DIA_Addon_Bloodwyn_Wait_BAD1()
{
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_BAD1_15_00");//Všecko jednou končí.
	Bloodwyn_Lach();
	Bloodwyn_Next_1();
	

	Bloodwyn_Choices_2(); 
};
//------------------------------------------------------------------------------
FUNC VOID DIA_Addon_Bloodwyn_Wait_GOOD2()
{
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_GOOD2_15_00");//A kdo si myslíš, že zničil bariéru?
	Bloodwyn_Wut();
	Bloodwyn_Next_2();
	

	Bloodwyn_Choices_3(); 
};

FUNC VOID DIA_Addon_Bloodwyn_Wait_BAD2()
{
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_BAD2_15_00");//Ty a taky spousta dalších chlapů.
	Bloodwyn_Lach();
	Bloodwyn_Next_2();
	

	Bloodwyn_Choices_3();
};
//------------------------------------------------------------------------------
FUNC VOID DIA_Addon_Bloodwyn_Wait_GOOD3()
{

	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_GOOD3_15_00");//Očividnę nemęl moc na výbęr.
	Bloodwyn_Wut();
	Info_ClearChoices (DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
};

FUNC VOID DIA_Addon_Bloodwyn_Wait_BAD3()
{

	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_BAD3_15_00");//Jo, to byla jeho nejvętší chyba.
	Bloodwyn_Wut();
	Info_ClearChoices (DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
};











	
	
	
	
	
	
	
	
	
	
	
		
	


