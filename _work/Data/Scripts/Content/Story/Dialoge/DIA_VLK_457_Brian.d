// *****************************************************
// 							EXIT 
// *****************************************************
INSTANCE DIA_Brian_EXIT   (C_INFO)
{
	npc         = VLK_457_Brian;
	nr          = 999;
	condition   = DIA_Brian_EXIT_Condition;
	information = DIA_Brian_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Brian_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Brian_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
 // ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Brian_PICKPOCKET (C_INFO)
{
	npc			= VLK_457_Brian;
	nr			= 900;
	condition	= DIA_Brian_PICKPOCKET_Condition;
	information	= DIA_Brian_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Brian_PICKPOCKET_Condition()
{
	C_Beklauen (55, 100);
};
 
FUNC VOID DIA_Brian_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Brian_PICKPOCKET);
	Info_AddChoice		(DIA_Brian_PICKPOCKET, DIALOG_BACK 		,DIA_Brian_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Brian_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Brian_PICKPOCKET_DoIt);
};

func void DIA_Brian_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Brian_PICKPOCKET);
};
	
func void DIA_Brian_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Brian_PICKPOCKET);
};
// *****************************************************
// 							Hallo 
// *****************************************************
instance DIA_Brian_HALLO		(C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 1;
	condition	= DIA_Brian_HALLO_Condition;
	information	= DIA_Brian_HALLO_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Brian_HALLO_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Brian_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Brian_HALLO_04_00"); //Jsi ve męstę nový, co? Jsem Brian! Jsem učedník mistra Harada.
};

// *****************************************************
// 					Wie ist Lehrling? 
// *****************************************************
instance DIA_Brian_AboutLehrling (C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 1;
	condition	= DIA_Brian_AboutLehrling_Condition;
	information	= DIA_Brian_AboutLehrling_Info;
	permanent 	= FALSE;
	description = "Co obnáší být kováâským učedníkem?";
};

func int DIA_Brian_AboutLehrling_Condition ()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};	
};

func void DIA_Brian_AboutLehrling_Info ()
{
	AI_Output (other, self, "DIA_Brian_AboutLehrling_15_00"); //Co obnáší být kováâským učedníkem?
	AI_Output (self, other, "DIA_Brian_AboutLehrling_04_01"); //Proč se ptáš? Chceš se stát mým nástupcem?
	AI_Output (other, self, "DIA_Brian_AboutLehrling_15_02"); //Možná.
	AI_Output (self, other, "DIA_Brian_AboutLehrling_04_03"); //Proč ne... Já už se brzy vyučím a pak opustím męsto.
	AI_Output (self, other, "DIA_Brian_AboutLehrling_04_04"); //Ale ne kvůli Haradovi. Je to dobrý mistr - hodnę jsem se od nęho naučil.
	
};

// *****************************************************
// 					Warum Stadt verlassen? 
// *****************************************************
instance DIA_Brian_WhyLeave (C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 1;
	condition	= DIA_Brian_WhyLeave_Condition;
	information	= DIA_Brian_WhyLeave_Info;
	permanent 	= FALSE;
	description = "Proč chceš opustit męsto?";
};

func int DIA_Brian_WhyLeave_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Brian_AboutLehrling))
	{
		return TRUE;
	};
};

func void DIA_Brian_WhyLeave_Info ()
{
	AI_Output (other,self , "DIA_Brian_WhyLeave_15_00"); //Proč chceš opustit męsto?
	AI_Output (self,other , "DIA_Brian_WhyLeave_04_00"); //Protože mi ti lidé tady lezou na nervy! Hlavnę ostatní mistâi.
	AI_Output (self, other, "DIA_Brian_WhyLeave_04_01"); //Ještę si pamatuju, co bylo kolem mého pâijetí za učedníka u Harada povyku.
	AI_Output (self, other, "DIA_Brian_WhyLeave_04_02"); //Vážnę, každej z tęch šašků do toho musel kecat.
	AI_Output (self, other, "DIA_Brian_WhyLeave_04_03"); //Chci se rozhodovat sám, ke komu půjdu, nebo nepůjdu dęlat učedníka.
};

// *****************************************************
// 						Other Masters
// *****************************************************
instance DIA_Brian_OtherMasters (C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 1;
	condition	= DIA_Brian_OtherMasters_Condition;
	information	= DIA_Brian_OtherMasters_Info;
	permanent 	= FALSE;
	description = "Kdo jsou ostatní mistâi?";
};
func int DIA_Brian_OtherMasters_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Brian_WhyLeave))
	&&  (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

func void DIA_Brian_OtherMasters_Info ()
{
	AI_Output (other, self, "DIA_Brian_Add_15_00"); //Kdo jsou ostatní mistâi?
	AI_Output (self ,other, "DIA_Brian_Add_04_01"); //No, je to tesaâ Thorben, výrobce luků Bosper, alchymista Constantino a Matteo.
	AI_Output (self ,other, "DIA_Brian_Add_04_02"); //Prodává zbroje, ale je pâedevším kupcem.
	AI_Output (self ,other, "DIA_Brian_Add_04_03"); //Všichni mistâi mají své obchody tady v téhle ulici.
	AI_Output (self ,other, "DIA_Brian_Add_04_04"); //A Constantinova dílna je v průchodu ke chrámu.
};



// *****************************************************
// 					Über Meister Harad
// *****************************************************
instance DIA_Brian_AboutHarad (C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 2;
	condition	= DIA_Brian_AboutHarad_Condition;
	information	= DIA_Brian_AboutHarad_Info;
	permanent 	= FALSE;
	description = "Âekni mi nęco víc o mistru Haradovi.";
};

func int DIA_Brian_AboutHarad_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Brian_AboutLehrling))
	{
		return TRUE;
	};
};

func void DIA_Brian_AboutHarad_Info ()
{
	AI_Output (other, self, "DIA_Brian_AboutHarad_15_00"); //Âekni mi nęco víc o mistru Haradovi.
	AI_Output (self, other, "DIA_Brian_AboutHarad_04_01"); //Teë zrovna nemá moc dobrou náladu.
	AI_Output (self, other, "DIA_Brian_AboutHarad_04_02"); //Pâed nękolika dny za ním pâišli paladinové s rozkazem ukovat nęjaké meče.
	AI_Output (self, other, "DIA_Brian_AboutHarad_04_03"); //Zakázali mu prodávat meče komukoli jinému.
	AI_Output (self, other, "DIA_Brian_AboutHarad_04_04"); //Teë dâe celé dny a noci, jen aby tu zakázku dokončil co nejdâíve.
};

// *****************************************************
// 					Waffen kaufen?
// *****************************************************
instance DIA_Brian_NEEDWEAPONS		(C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 4;
	condition	= DIA_Brian_NEEDWEAPONS_Condition;
	information	= DIA_Brian_NEEDWEAPONS_Info;
	permanent 	= FALSE;
	description	= "Mohu si od tebe koupit nęjaké zbranę?";
};

func int DIA_Brian_NEEDWEAPONS_Condition ()
{
	return TRUE;
};

func void DIA_Brian_NEEDWEAPONS_Info ()
{
	AI_Output (other, self, "DIA_Brian_NEEDWEAPONS_15_00"); //Mohu si od tebe koupit nęjaké zbranę?
	AI_Output (self, other, "DIA_Brian_NEEDWEAPONS_04_01"); //Vážnę ne. Jsem jen pomocník.
	AI_Output (self, other, "DIA_Brian_NEEDWEAPONS_04_02"); //Ty zbranę, co se vyrábęjí tady v kovárnę, sebere domobrana a odnese je do vęží.
	AI_Output (self, other, "DIA_Brian_NEEDWEAPONS_04_03"); //Ale kdybys męl zájem o nęco, co potâebuješ v kovárnę, možná bych ti mohl pomoct.
};


// *****************************************************
// 					Schmiede-Stuff kaufen
// *****************************************************

//------------------------------------------------------
var int Brian_Trade_einmal;

instance DIA_Brian_WASKAUFEN		(C_INFO)
{
	npc			= VLK_457_Brian;
	nr			= 4;
	condition	= DIA_Brian_WASKAUFEN_Condition;
	information	= DIA_Brian_WASKAUFEN_Info;
	permanent	= TRUE;
	description	= "Co od tebe můžu získat?";
	trade		= TRUE;
};

func int DIA_Brian_WASKAUFEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Brian_NEEDWEAPONS))
	{
		return TRUE;
	};
};

func void DIA_Brian_WASKAUFEN_Info ()
{
	AI_Output			(other, self, "DIA_Brian_WASKAUFEN_15_00"); //Co od tebe můžu získat?
	B_GiveTradeInv (self);

	if (Npc_IsDead(Harad))
	{
		AI_Output			(self, other, "DIA_Brian_WASKAUFEN_04_01"); //Jelikož ještę poâád mám nękolik ocelových prutů, můžou být tvoje. Obávám se, že to je všechno.
		
		if (MIS_Jack_NewLighthouseOfficer == 0)
		{
			AI_Output			(self, other, "DIA_Brian_WASKAUFEN_04_02"); //Jelikož už tu není Harad, dává na mę domobrana pozor.
			AI_Output			(self, other, "DIA_Brian_WASKAUFEN_04_03"); //Já kovárnu nedokážu dál vést. Mají strach, že to celé prodám a prásknu do bot.
		};
	}
	else
	{
		AI_Output			(self, other, "DIA_Brian_WASKAUFEN_04_05"); //Můžu ti prodat pár ocelových prutů.
	};
	
	if (Brian_Trade_Einmal == FALSE)
	{
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Haradův učedník Brian prodává ocelové pruty."); 
		Brian_Trade_Einmal = TRUE;
	};
	Npc_RemoveInvItems (self,ItMiSwordblade,Npc_HasItems (self,ItMiSwordblade));
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Brian_KAP3_EXIT(C_INFO)
{
	npc			= VLK_457_Brian;
	nr			= 999;
	condition	= DIA_Brian_KAP3_EXIT_Condition;
	information	= DIA_Brian_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Brian_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Brian_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//*********************************************************************
//	Kannst du auch Schmuckstücke reparieren?
//*********************************************************************
instance DIA_Brian_RepairNecklace		(C_INFO)
{
	npc		 	 = 	VLK_457_Brian;
	nr           = 	8;
	condition	 = 	DIA_Brian_RepairNecklace_Condition;
	information	 = 	DIA_Brian_RepairNecklace_Info;
	permanent	 = 	FALSE;
	description	 = 	"Umíš opravit i klenoty?";
};

func int DIA_Brian_RepairNecklace_Condition ()
{
	if 	(
		(MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
		&&	 	(
				(Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) 
				|| 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE)
				)
		) 
		{
			return TRUE;
		};
};

func void DIA_Brian_RepairNecklace_Info ()
{
	AI_Output (other,self ,"DIA_Brian_RepairNecklace_15_00"); //Umíš opravit i klenoty?
	AI_Output (self	,other,"DIA_Brian_RepairNecklace_04_01"); //Jsem jen pomocník, budu rád, když nękdy dokážu ukovat alespoŕ nęjaký nůž.
	
	if ((Npc_IsDead (Harad))== FALSE)
	{
		AI_Output (self ,other,"DIA_Brian_RepairNecklace_04_02"); //Šperky? Męl by ses zeptat mistra.
	};
	
	MIS_SCKnowsInnosEyeIsBroken  = TRUE; 	
};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Brian_KAP4_EXIT(C_INFO)
{
	npc			= VLK_457_Brian;
	nr			= 999;
	condition	= DIA_Brian_KAP4_EXIT_Condition;
	information	= DIA_Brian_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Brian_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Brian_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Brian_KAP5_EXIT(C_INFO)
{
	npc			= VLK_457_Brian;
	nr			= 999;
	condition	= DIA_Brian_KAP5_EXIT_Condition;
	information	= DIA_Brian_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Brian_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Brian_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info NewLighthouseOfficer
///////////////////////////////////////////////////////////////////////
instance DIA_Brian_NEWLIGHTHOUSEOFFICER		(C_INFO)
{
	npc		 = 	VLK_457_Brian;
	nr		 = 	51;
	condition	 = 	DIA_Brian_NEWLIGHTHOUSEOFFICER_Condition;
	information	 = 	DIA_Brian_NEWLIGHTHOUSEOFFICER_Info;

	description	 = 	"Zaslechl jsem, že ses zajímal o Jackův starý maják.";
};

func int DIA_Brian_NEWLIGHTHOUSEOFFICER_Condition ()
{
	if (Kapitel == 5)	
	&& (MIS_Jack_NewLighthouseOfficer == LOG_RUNNING)	
	&& (Npc_KnowsInfo(other, DIA_Brian_NEEDWEAPONS))
		{
			return TRUE;
		};
};

func void DIA_Brian_NEWLIGHTHOUSEOFFICER_Info ()
{
	AI_Output			(other, self, "DIA_Brian_NEWLIGHTHOUSEOFFICER_15_00"); //Zaslechl jsem, že ses zajímal o Jackův starý maják.
	AI_Output			(other, self, "DIA_Brian_NEWLIGHTHOUSEOFFICER_15_01"); //Jack uvažuje o tom, že by se vrátil na moâe. Ale jeho maják pak nebude mít kdo hlídat.
	AI_Output			(self, other, "DIA_Brian_NEWLIGHTHOUSEOFFICER_04_02"); //Ale snad je Jackovi jasné, že si tam u majáku zaâídím kovárnu, když tam už nebude.
	AI_Output			(other, self, "DIA_Brian_NEWLIGHTHOUSEOFFICER_15_03"); //Je v tom nęjaký problém?
	AI_Output			(self, other, "DIA_Brian_NEWLIGHTHOUSEOFFICER_04_04"); //(smích) Pro mę ne. Stejnę se mi nechce zůstávat u Harada. Žádnej problém.
	AI_Output			(self, other, "DIA_Brian_NEWLIGHTHOUSEOFFICER_04_05"); //Souhlas. Uvidíme se u Jacka.
	MIS_Jack_NewLighthouseOfficer = LOG_SUCCESS;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Lighthouse");
};


///////////////////////////////////////////////////////////////////////
//	Info LighthouseFree
///////////////////////////////////////////////////////////////////////
instance DIA_Brian_LIGHTHOUSEFREE		(C_INFO)
{
	npc		 = 	VLK_457_Brian;
	nr		 = 	8;
	condition	 = 	DIA_Brian_LIGHTHOUSEFREE_Condition;
	information	 = 	DIA_Brian_LIGHTHOUSEFREE_Info;
	permanent	 = 	TRUE;


	description	 = 	"Tak co tomu âíkáš?";
};

func int DIA_Brian_LIGHTHOUSEFREE_Condition ()
{
	if (MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS)
		&&	(Npc_GetDistToWP(self,"NW_LIGHTHOUSE_IN_01")<1000)
		&& (Kapitel == 5) 
		{
				return TRUE;
		};
};

func void DIA_Brian_LIGHTHOUSEFREE_Info ()
{
	AI_Output			(other, self, "DIA_Brian_LIGHTHOUSEFREE_15_00"); //A co jsi âíkal?
	AI_Output			(self, other, "DIA_Brian_LIGHTHOUSEFREE_04_01"); //No nazdar, takovej bordel. Jack to tu nepozná, až s tím budu hotov.
};






























