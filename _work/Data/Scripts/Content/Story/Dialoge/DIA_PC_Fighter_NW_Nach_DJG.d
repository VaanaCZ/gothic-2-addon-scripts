
// ************************************************************
// 	  				   EXIT 
// ************************************************************

INSTANCE DIA_GornNW_nach_DJG_KAP5_EXIT(C_INFO)
{
	npc			= PC_Fighter_NW_nach_DJG;
	nr			= 999;
	condition	= DIA_GornNW_nach_DJG_KAP5_EXIT_Condition;
	information	= DIA_GornNW_nach_DJG_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_GornNW_nach_DJG_KAP5_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_GornNW_nach_DJG_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  	  Ich habe alle Drachen getˆtet. (Perm Kap 5)
// ************************************************************

INSTANCE DIA_GornNW_nach_DJG_AllDragonsDead(C_INFO)
{
	npc			= PC_Fighter_NW_nach_DJG;
	nr			= 59;
	condition	= DIA_GornNW_nach_DJG_AllDragonsDead_Condition;
	information	= DIA_GornNW_nach_DJG_AllDragonsDead_Info;
	permanent	= TRUE;

	description = "OdpoËinul sis?";
};                       
FUNC INT DIA_GornNW_nach_DJG_AllDragonsDead_Condition()
{
	if (Gorn_IsOnBoard != LOG_SUCCESS) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_GornNW_nach_DJG_AllDragonsDead_Info()
{	
	AI_Output (other,self ,"DIA_GornNW_nach_DJG_AllDragonsDead_15_00"); //OdpoËinul sis?
	AI_Output (self ,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_01"); //JasnÏ, proË ne? Draci jsou mrtvÌ, ne?
	AI_Output (other,self ,"DIA_GornNW_nach_DJG_AllDragonsDead_15_02"); //Je to troöku sloûitÏjöÌ.
	AI_Output (self ,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_03"); //(zasmÏje se) JasnÏ. Jako vûdycky. Dej mi vÏdÏt, aû budeö pot¯ebovat mou sekeru.
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_GornNW_nach_DJG_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	PC_Fighter_NW_nach_DJG;
	nr			 = 	55;
	condition	 = 	DIA_GornNW_nach_DJG_KnowWhereEnemy_Condition;
	information	 = 	DIA_GornNW_nach_DJG_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"MÏl bych pro tebe a tvou sekeru nÏjakou pr·ci.";
};
func int DIA_GornNW_nach_DJG_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Gorn_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_GornNW_nach_DJG_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_GornNW_nach_DJG_KnowWhereEnemy_15_00"); //MÏl bych pro tebe a tvou sekeru nÏjakou pr·ci.
	AI_Output			(self, other, "DIA_GornNW_nach_DJG_KnowWhereEnemy_12_01"); //Jasan. Nep¯ekvapuje mÏ to. Co pro tebe m˘ûu udÏlat?
	AI_Output			(other, self, "DIA_GornNW_nach_DJG_KnowWhereEnemy_15_02"); //Plul bys se mnou na jeden ostrov a natrhnul tam zadek p·r nep¯·tel˘m?
	AI_Output			(self, other, "DIA_GornNW_nach_DJG_KnowWhereEnemy_12_03"); //(zasmÏje se) JasnÏ. KlidnÏ hned. Jen mi ¯ekni, co je zapot¯ebÌ.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	B_LogEntry (TOPIC_Crew,"Kdyû jsem Gornovi vypr·vÏl o ostrovÏ, byl jednoznaËnÏ pro. Budu-li pot¯ebovat jeho sekeru, mohu ho smÏle vzÌt s sebou.");
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_GornNW_nach_DJG_KnowWhereEnemy_15_04"); //Moment·lnÏ m·m v pos·dce pln˝ stav, ale r·d bych vzal s sebou i tebe.
		AI_Output			(self, other, "DIA_GornNW_nach_DJG_KnowWhereEnemy_12_05"); //Pokud musÌö kv˘li mÏ vykopnout nÏkoho z pos·dky, vyber toho nejslaböÌho.
		AI_Output			(self, other, "DIA_GornNW_nach_DJG_KnowWhereEnemy_12_06"); //V tÏchhle tÏûk˝ch Ëasech je kaûd· ruka dobr·.
	}
	else 
	{
		Info_ClearChoices (DIA_GornNW_nach_DJG_KnowWhereEnemy);
		Info_AddChoice (DIA_GornNW_nach_DJG_KnowWhereEnemy,"D·m ti vÏdÏt, aû bude na Ëase.",DIA_GornNW_nach_DJG_KnowWhereEnemy_No);
		Info_AddChoice (DIA_GornNW_nach_DJG_KnowWhereEnemy,"Popluj se mnou. PoËkej na mÏ v z·livu.",DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_15_00"); //Popluj se mnou. PoËkej na mÏ v p¯Ìstavu.
	AI_Output (self ,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_12_01"); //LoÔ? Ha! Teda ¯eknu ti, ûe s tebou se jeden nikdy nenudÌ. Brzy se uvidÌme.
	
	
	B_GivePlayerXP (XP_Crewmember_Success); 
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Gorn_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_GornNW_nach_DJG_KnowWhereEnemy);
};

FUNC VOID DIA_GornNW_nach_DJG_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_15_00"); //D·m ti vÏdÏt, aû bude naËase.
	AI_Output (self ,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_12_01"); //Dobr·.

	Gorn_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_GornNW_nach_DJG_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_GornNW_nach_DJG_LeaveMyShip		(C_INFO)
{
	npc			 = 	PC_Fighter_NW_nach_DJG;
	nr			 = 	55;
	condition	 = 	DIA_GornNW_nach_DJG_LeaveMyShip_Condition;
	information	 = 	DIA_GornNW_nach_DJG_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Moûn· bys mÏl radÏji z˘stat tady.";
};
func int DIA_GornNW_nach_DJG_LeaveMyShip_Condition ()
{	
	if (Gorn_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_GornNW_nach_DJG_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_GornNW_nach_DJG_LeaveMyShip_15_00"); //Moûn· bys mÏl radÏji z˘stat tady.
	AI_Output			(self, other, "DIA_GornNW_nach_DJG_LeaveMyShip_12_01"); //To tÏ m·m nechat jÌt samotnÈho? Hmm. NenÌ to pro mÏ jednoduchÈ, ale je to koneckonc˘ tvoje v·lka. Pokud bys nakonec p¯ece jenom chtÏl, abych öel s tebou, klidnÏ za mnou p¯ijÔ.
	
	Gorn_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"Start"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir ¸berlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_GornNW_nach_DJG_StillNeedYou		(C_INFO)
{
	npc			 = 	PC_Fighter_NW_nach_DJG;
	nr			 = 	55;
	condition	 = 	DIA_GornNW_nach_DJG_StillNeedYou_Condition;
	information	 = 	DIA_GornNW_nach_DJG_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Vraù se. Pot¯ebuji tÏ.";
};

func int DIA_GornNW_nach_DJG_StillNeedYou_Condition ()
{	
	if ((Gorn_IsOnBOard == LOG_OBSOLETE)	
	|| (Gorn_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_StillNeedYou_Info ()
{
	AI_Output	(other, self, "DIA_GornNW_nach_DJG_StillNeedYou_15_00"); //Vraù se. Pot¯ebuji tÏ.
	AI_Output	(self, other, "DIA_GornNW_nach_DJG_StillNeedYou_12_01"); //No tak vidÌö. A j· uû si myslel, ûe mÏ tu nech·ö shnÌt, zatÌmco si budeö s·m uûÌvat. UvidÌme se pozdÏjc.
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Gorn_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	AI_StopProcessInfos (self);

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine (self,"SHIP"); 
	}
	else
	{
		Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
	};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fighter_nach_DJG_PICKPOCKET (C_INFO)
{
	npc			= PC_Fighter_NW_nach_DJG;
	nr			= 900;
	condition	= DIA_Fighter_nach_DJG_PICKPOCKET_Condition;
	information	= DIA_Fighter_nach_DJG_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Fighter_nach_DJG_PICKPOCKET_Condition()
{
	C_Beklauen (10, 25);
};
 
FUNC VOID DIA_Fighter_nach_DJG_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fighter_nach_DJG_PICKPOCKET);
	Info_AddChoice		(DIA_Fighter_nach_DJG_PICKPOCKET, DIALOG_BACK 		,DIA_Fighter_nach_DJG_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fighter_nach_DJG_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fighter_nach_DJG_PICKPOCKET_DoIt);
};

func void DIA_Fighter_nach_DJG_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fighter_nach_DJG_PICKPOCKET);
};
	
func void DIA_Fighter_nach_DJG_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fighter_nach_DJG_PICKPOCKET);
};


