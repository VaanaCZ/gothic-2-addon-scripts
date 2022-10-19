// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Fester_EXIT(C_INFO)
{
	npc			= Sld_816_Fester;
	nr			= 999;
	condition	= DIA_Fester_EXIT_Condition;
	information	= DIA_Fester_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Fester_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fester_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  					Hello 
// ************************************************************

instance DIA_Fester_Hello (C_INFO)
{
	npc			= Sld_816_Fester;
	nr			= 1;
	condition	= DIA_Fester_Hello_Condition;
	information	= DIA_Fester_Hello_Info;
	permanent	= FALSE;
	description = "Co tady dÏl·ö?";
};                       

FUNC INT DIA_Fester_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Fester_Hello_Info()
{	
	AI_Output (other, self, "DIA_Fester_Hello_15_00"); //Co tady dÏl·ö?
	AI_Output (self, other, "DIA_Fester_Hello_08_01"); //P¯ipravuju se na boj.
};

// ************************************************************
// 			  					Auftrag 
// ************************************************************

instance DIA_Fester_Auftrag (C_INFO)
{
	npc			= Sld_816_Fester;
	nr			= 2;
	condition	= DIA_Fester_Auftrag_Condition;
	information	= DIA_Fester_Auftrag_Info;
	permanent	= FALSE;
	description = "ProË?";
};                       

FUNC INT DIA_Fester_Auftrag_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Fester_Hello))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Fester_Auftrag_Info()
{	
	AI_Output (other, self, "DIA_Fester_Auftrag_15_00"); //ProË?
	AI_Output (self, other, "DIA_Fester_Auftrag_08_01"); //PoslednÌ dobou majÌ sedl·ci ËÌm d·l vÏtöÌ problÈmy s polnÌmi ök˘dci.
	AI_Output (self, other, "DIA_Fester_Auftrag_08_02"); //Jen p·r se jich nÏjak uûivÌ.
	AI_Output (self, other, "DIA_Fester_Auftrag_08_03"); //TlustÈmu Onarovi to ale zrovna z·bavnÈ nep¯ipad·. Nikdo z n·s uû p¯es t˝den nedostal v˝platu.
	AI_Output (self, other, "DIA_Fester_Auftrag_08_04"); //A vÌcemÈnÏ to byla moje chyba. Lee teÔ chce, abych s·m zlikvidoval hnÌzdo tÏch potvor.
	AI_Output (self, other, "DIA_Fester_Auftrag_08_05"); //A ostatnÌ kluci se s·zejÌ, jestli to p¯eûiju, nebo ne.
};

// ************************************************************
// 			  				Du K‰mpfer? 
// ************************************************************

instance DIA_Fester_YouFight (C_INFO)
{
	npc			= Sld_816_Fester;
	nr			= 3;
	condition	= DIA_Fester_YouFight_Condition;
	information	= DIA_Fester_YouFight_Info;
	permanent	= FALSE;
	description = "Jsi dobr˝ bojovnÌk?";
};                       

FUNC INT DIA_Fester_YouFight_Condition()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Npc_KnowsInfo (other, DIA_Fester_Hello))
	&& (MIS_Fester_KillBugs == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Fester_YouFight_Info()
{	
	AI_Output (other, self, "DIA_Fester_YouFight_15_00"); //Jsi dobr˝ bojovnÌk?
	AI_Output (self, other, "DIA_Fester_YouFight_08_01"); //S meËem to celkem umÌm, ale s lukem zach·zÌm mnohem lÌp. ProË se pt·ö?
};


// ************************************************************
// 			  				WoNest
// ************************************************************

instance DIA_Fester_WoNest (C_INFO)
{
	npc			= Sld_816_Fester;
	nr			= 4;
	condition	= DIA_Fester_WoNest_Condition;
	information	= DIA_Fester_WoNest_Info;
	permanent	= FALSE;
	description = "Kde je to hnÌzdo?";
};                       

FUNC INT DIA_Fester_WoNest_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Fester_Auftrag))
	&& (MIS_Fester_KillBugs == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Fester_WoNest_Info()
{	
	AI_Output (other, self, "DIA_Fester_WoNest_15_00"); //Kde je to hnÌzdo?
	AI_Output (self, other, "DIA_Fester_WoNest_08_01"); //Tady vedle pole, v tÈ malÈ jeskyni.
};


// ************************************************************
// 			  				Du K‰mpfer? 
// ************************************************************

var int Fester_Choice;
const int FC_Gold = 0;
const int FC_Join = 1;

instance DIA_Fester_Together (C_INFO)
{
	npc			= Sld_816_Fester;
	nr			= 5;
	condition	= DIA_Fester_Together_Condition;
	information	= DIA_Fester_Together_Info;
	permanent	= FALSE;
	description = "Tak na to hnÌzdo m˘ûeme za˙toËit spoleËnÏ.";
};                       

FUNC INT DIA_Fester_Together_Condition()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Npc_KnowsInfo (other, DIA_Fester_Auftrag))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Fester_Together_Info()
{	
	AI_Output (other, self, "DIA_Fester_Together_15_00"); //Tak na to hnÌzdo m˘ûeme za˙toËit spoleËnÏ.
	AI_Output (self, other, "DIA_Fester_Together_08_01"); //Ty mi chceö pomoct? ProË?
	
	Info_ClearChoices (DIA_Fester_Together);
	Info_AddChoice (DIA_Fester_Together, "R·d bych vidÏl nÏjak˝ love!", DIA_Fester_Together_Gold);
	if (hero.guild == GIL_NONE)
	{
		Info_AddChoice (DIA_Fester_Together, "R·d bych se k v·m p¯idal!", DIA_Fester_Together_Join);
	};
};

func void DIA_Fester_Together_Join()
{
	AI_Output (other, self, "DIA_Fester_Together_Join_15_00"); //R·d bych se k v·m p¯idal!
	AI_Output (self, other, "DIA_Fester_Together_Join_08_01"); //Aha, tak je to tedy. Chceö dok·zat, jak jsi dobr˝.
	AI_Output (self, other, "DIA_Fester_Together_Join_08_02"); //(vychytrale) Dob¯e, tak na to hnÌzdo za˙toËÌme spoleËnÏ.
	Fester_Choice = FC_Join;
	Info_ClearChoices (DIA_Fester_Together);
};

func void DIA_Fester_Together_Gold()
{
		
	AI_Output (other, self, "DIA_Fester_Together_Gold_15_00"); //R·d bych vidÏl nÏjakÈ praöule!
	AI_Output (self, other, "DIA_Fester_Together_Gold_08_01"); //(smÏje se) Ty hajzle! Chceö tÏûit z m˝ situace, co?
	AI_Output (self, other, "DIA_Fester_Together_Gold_08_02"); //BuÔ ti ale zaplatÌm, nebo budu brzo ûr·t hlÌnu.
	AI_Output (self, other, "DIA_Fester_Together_Gold_08_03"); //No dob¯e. D·m ti 50 zlaù·k˘ - vÌc nem·m.
	Fester_Choice = FC_Gold;
	Info_ClearChoices (DIA_Fester_Together);
};

// ************************************************************
// 			  				Du K‰mpfer? 
// ************************************************************
var int Fester_Losgeh_Day;
// -----------------------

instance DIA_Fester_TogetherNOW (C_INFO)
{
	npc			= Sld_816_Fester;
	nr			= 6;
	condition	= DIA_Fester_TogetherNOW_Condition;
	information	= DIA_Fester_TogetherNOW_Info;
	permanent	= TRUE;
	description = "Tak pojÔme na to hnÌzdo!";
};                       

FUNC INT DIA_Fester_TogetherNOW_Condition()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Npc_KnowsInfo (other, DIA_Fester_Together))
	&& (MIS_Fester_KillBugs == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Fester_TogetherNOW_Info()
{	
	AI_Output (other, self, "DIA_Fester_TogetherNOW_15_00"); //Tak pojÔme na to hnÌzdo!
	
	if (Wld_IsTime (20,30,06,00))
	{
		AI_Output (self, other, "DIA_Fester_TogetherNOW_08_01"); //PotmÏ? Ne, radöi bychom to mÏli udÏlat ve dne.
	}
	else
	{
		AI_Output (self, other, "DIA_Fester_TogetherNOW_08_02"); //TeÔ? Nepot¯ebujeö se nejd¯Ìv trochu vybavit?
		AI_Output (self, other, "DIA_Fester_TogetherNOW_08_03"); //MÏl by sis jeötÏ dojÌt na statek.
		
		Info_ClearChoices (DIA_Fester_TogetherNOW);
		Info_AddChoice (DIA_Fester_TogetherNOW, "No dob¯e, tak tedy jeötÏ chvÌli poËkejme.", DIA_Fester_TogetherNOW_Later);
		Info_AddChoice (DIA_Fester_TogetherNOW, "Jindy uû nebude takov· p¯Ìleûitost.", DIA_Fester_TogetherNOW_NOW);
	};
};

func void DIA_Fester_TogetherNOW_Now()
{
	AI_Output (other, self, "DIA_Fester_TogetherNOW_Now_15_00"); //Jindy uû nebude takov· p¯Ìleûitost.
	AI_Output (self, other, "DIA_Fester_TogetherNOW_Now_08_01"); //Fajn, tak uvidÌme, co v tobÏ je.
	
	Npc_ExchangeRoutine (self, "GUIDE");

	Fester_Losgeh_Day = B_GetDayPlus();
	
	MIS_Fester_KillBugs = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_FesterRauber,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_FesterRauber,LOG_RUNNING);
	B_LogEntry (TOPIC_FesterRauber,"Spolu s Festerem zniËÌme hnÌzdo polnÌch ök˘dc˘.");
	
	Info_ClearChoices (DIA_Fester_TogetherNOW);
	AI_StopProcessInfos (self); 
};

func void DIA_Fester_TogetherNOW_Later()
{
		
	AI_Output (other, self, "DIA_Fester_TogetherNOW_Later_15_00"); //No dob¯e, tak tedy jeötÏ chvÌli poËkejme.
	AI_Output (self, other, "DIA_Fester_TogetherNOW_Later_08_01"); //VÌö, kde mÏ najdeö.
	Info_ClearChoices (DIA_Fester_TogetherNOW);
};
		

// ************************************************************
// 			  				InCave 
// ************************************************************

instance DIA_Fester_InCave (C_INFO)
{
	npc			= Sld_816_Fester;
	nr			= 7;
	condition	= DIA_Fester_InCave_Condition;
	information	= DIA_Fester_InCave_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Fester_InCave_Condition()
{
	if (MIS_Fester_KillBugs == LOG_RUNNING)
	&& (Npc_GetDistToWP (self, "NW_BIGFARM_FELDREUBER4") <= 500)
	{
		self.aivar[AIV_LastFightComment] = TRUE; //NEWS darf nicht kommen!
		
		return TRUE;
	};
};
 
FUNC VOID DIA_Fester_InCave_Info()
{	

	if (Wld_GetDay() > Fester_Losgeh_Day)
	{
		AI_Output (self, other, "DIA_Fester_InCave_08_00"); //Kde k Ëertu vÏzÌö?
	}
	else //zeitlich passend
	{
		AI_Output (self, other, "DIA_Fester_InCave_08_01"); //Takûe sem zavlÈkajÌ mrtvÈ sedl·ky. To je ale humus.
	};

	AI_Output (self, other, "DIA_Fester_InCave_08_02"); //My jsme ale s tÏmi öpinav˝mi zr˘dami skoncovali.
	AI_Output (self, other, "DIA_Fester_InCave_08_03"); //Vraùme se!
	
	Npc_ExchangeRoutine (self, "START");
	
	AI_StopProcessInfos(self);
};
	

// ************************************************************
// 			  				WasMitAbmachung? 
// ************************************************************

instance DIA_Fester_WasMitAbmachung (C_INFO)
{
	npc			= Sld_816_Fester;
	nr			= 8;
	condition	= DIA_Fester_WasMitAbmachung_Condition;
	information	= DIA_Fester_WasMitAbmachung_Info;
	permanent	= FALSE;
	description	= "A co naöe dohoda?";
};                       

FUNC INT DIA_Fester_WasMitAbmachung_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Fester_InCave))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Fester_WasMitAbmachung_Info()
{	
	AI_Output (other, self, "DIA_Fester_WasMitAbmachung_15_00"); //A co naöe dohoda?
	if (Festers_Giant_Bug_Killed == 0)
	{
		AI_Output (self, other, "DIA_Fester_WasMitAbmachung_08_01"); //DÏl·ö si srandu? Vûdyù jsi neudÏlal v˘bec nic!
	}
	else if (Fester_Choice == FC_Join)
	{
		AI_Output (self, other, "DIA_Fester_WasMitAbmachung_08_02"); //No, mohl bych ti pomoct, abychom tÏ vzali mezi sebe, ale neudÏl·m to.
		AI_Output (other, self, "DIA_Fester_WasMitAbmachung_15_03"); //A proË?
		AI_Output (self, other, "DIA_Fester_WasMitAbmachung_08_04"); //Kdybych nÏkomu vyûvanil, ûes mi pomohl, dali by mi nÏjakou jinou pr·ci.
		AI_Output (self, other, "DIA_Fester_WasMitAbmachung_08_05"); //UrËitÏ ch·peö, ûe to by se mi zrovna nelÌbilo.
		AI_Output (self, other, "DIA_Fester_WasMitAbmachung_08_06"); //No, je to sm˘la, hochu. UrËitÏ ale najdeö nÏkoho jinÈho, kdo ti pom˘ûe.
	}
	else //FC_Gold
	{
		AI_Output (self, other, "DIA_Fester_WasMitAbmachung_08_07"); //Hej, tys chtÏl tÏûit z mojÌ situace. Takûe teÔ zase trochu j· zneuûiju t˝ tvojÌ.
		AI_Output (self, other, "DIA_Fester_WasMitAbmachung_08_08"); //Ber to ale z t˝ lepöÌ str·nky: zÌskals cennou zkuöenost, a to za to p¯ece stojÌ, ne?
	};
	
	MIS_Fester_KillBugs = LOG_OBSOLETE;
	
	//Bugs inserten, die wegen ihm raus waren
	Wld_InsertNpc (Giant_Bug, "NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc (Giant_Bug, "NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc (Giant_Bug, "NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	
	Wld_InsertNpc (Giant_Bug, "NW_BIGMILL_FIELD_MONSTER_04");
	Wld_InsertNpc (Giant_Bug, "NW_BIGMILL_FIELD_MONSTER_04");
};


// ************************************************************
// 			  			PERMPruegel 
// ************************************************************
var int Fester_Duell_Day;
var int Fester_FightVerarscht;
var int Fester_FightSylvio;

instance DIA_Fester_PERMPruegel (C_INFO)
{
	npc			= Sld_816_Fester;
	nr			= 9;
	condition	= DIA_Fester_PERMPruegel_Condition;
	information	= DIA_Fester_PERMPruegel_Info;
	permanent	= TRUE;
	description	= "MyslÌm, ûe ti trochu zmaluju h¯bet.";
};                       

FUNC INT DIA_Fester_PERMPruegel_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Fester_WasMitAbmachung)) 
	|| (Npc_KnowsInfo (other, DIA_Jarvis_MissionKO))
	|| (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Fester_PERMPruegel_Info()
{	
	AI_Output (other, self, "DIA_Fester_PERMPruegel_15_00"); //MyslÌm, ûe ti trochu zmaluju h¯bet.
	
	if (Fester_Duell_Day < Wld_GetDay())
	{
		var int random;
		random = Hlp_Random (11);
		
		CreateInvItems (self, itmi_gold, random);
			
		Fester_Duell_Day = Wld_GetDay();
	};

	if (Npc_KnowsInfo (other, DIA_Fester_WasMitAbmachung)) 
	&& (Fester_FightVerarscht == FALSE)
	{
		AI_Output (other, self, "DIA_Fester_PERMPruegel_15_01"); //Nem·m r·d, kdyû si ze mÏ nÏkdo dÏl· öoufky.
		AI_Output (self, other, "DIA_Fester_PERMPruegel_08_02"); //Uû se bojÌm, uû se bojÌm!
		Fester_FightVerarscht = TRUE;
	}
	else if (Npc_KnowsInfo (other, DIA_Jarvis_MissionKO))
	{
		AI_Output (other, self, "DIA_Fester_PERMPruegel_15_03"); //NeudÏlals dob¯e, ûe ses spolËil se Sylviem.
		AI_Output (self, other, "DIA_Fester_PERMPruegel_08_04"); //Tys jeden z tÏch Leeov˝ch vlezdoprdelk˘, co? Tak tos narazil na toho nepravÈho!
		Fester_FightSylvio = TRUE;
	}
	else
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output (self, other, "DIA_Fester_PERMPruegel_08_05"); //Co po mnÏ k Ëertu chceö?
			AI_Output (other, self, "DIA_Fester_PERMPruegel_15_06"); //Jenom se mi lÌbÌ, kdyû si m·ch·ö hubu v bl·tÏ!
		}
		else
		{
			AI_Output (self, other, "DIA_Fester_PERMPruegel_08_07"); //Ty to nech·peö, co?
		};
	};
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};
		

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fester_PICKPOCKET (C_INFO)
{
	npc			= Sld_816_Fester;
	nr			= 900;
	condition	= DIA_Fester_PICKPOCKET_Condition;
	information	= DIA_Fester_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Fester_PICKPOCKET_Condition()
{
	C_Beklauen (27, 45);
};
 
FUNC VOID DIA_Fester_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fester_PICKPOCKET);
	Info_AddChoice		(DIA_Fester_PICKPOCKET, DIALOG_BACK 		,DIA_Fester_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fester_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fester_PICKPOCKET_DoIt);
};

func void DIA_Fester_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fester_PICKPOCKET);
};
	
func void DIA_Fester_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fester_PICKPOCKET);
};




			
			





		


		
		


		






