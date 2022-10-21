///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Alvares_EXIT   (C_INFO)
{
	npc         = SLD_840_Alvares;
	nr          = 999;
	condition   = DIA_Alvares_EXIT_Condition;
	information = DIA_Alvares_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Alvares_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Alvares_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info HauAb
///////////////////////////////////////////////////////////////////////
instance DIA_Alvares_HAUAB		(C_INFO)
{
	npc			 = 	SLD_840_Alvares;
	nr			 = 	4;
	condition	 = 	DIA_Alvares_HAUAB_Condition;
	information	 = 	DIA_Alvares_HAUAB_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Alvares_HAUAB_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Alvares_HAUAB_Info ()
{
	Akils_SLDStillthere = TRUE;
	AI_Output (self, other, "DIA_Alvares_HAUAB_11_00"); //Aù uû tÏ sem p¯ivedlo cokoliv, radöi na to zapomeÚ a bÏû d·l.
	Log_CreateTopic (TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"Akil˘v statek ohroûujÌ ûold·ci."); 
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Attack
///////////////////////////////////////////////////////////////////////
instance DIA_Alvares_ATTACK		(C_INFO)
{
	npc			 = 	SLD_840_Alvares;
	nr			 = 	6;
	condition	 = 	DIA_Alvares_ATTACK_Condition;
	information	 = 	DIA_Alvares_ATTACK_Info;
	permanent	 = 	FALSE;
	important	 = 	TRUE;
};
func int DIA_Alvares_ATTACK_Condition ()
{
	if	(Npc_KnowsInfo(other, DIA_Alvares_HAUAB))
	&&  (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Alvares_ATTACK_Info ()
{
	AI_Output (self, other, "DIA_Alvares_ATTACK_11_00"); //Hej, tys jeötÏ tady? Dal jsem ti na v˝bÏr, cizinËe: buÔ vypadni, nebo chcÌpni.
	
	Info_ClearChoices (DIA_Alvares_ATTACK);
	Info_AddChoice 	  (DIA_Alvares_ATTACK,"Co jste zaË? P·rek vtip·lk˘?",DIA_Alvares_ATTACK_Kerle);
	Info_AddChoice 	  (DIA_Alvares_ATTACK,"Chci se k v·m p¯idat.",DIA_Alvares_ATTACK_Soeldner);
	Info_AddChoice 	  (DIA_Alvares_ATTACK,"TeÔka odsud hezky rychle vypadnete...",DIA_Alvares_ATTACK_Witz);	 
	Info_AddChoice 	  (DIA_Alvares_ATTACK,"NestojÌm o û·dnÈ problÈmy.",DIA_Alvares_ATTACK_Aerger);
	
	if (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	{
		Info_AddChoice 	  (DIA_Alvares_ATTACK,"Jen jsem si p¯iöel nÏco vyzvednout.",DIA_Alvares_ATTACK_Lieferung);
	};
	
	
};
FUNC VOID DIA_Alvares_ATTACK_Witz()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Witz_15_00"); //Hele, kluci, prostÏ odtuÔ hnedka zmizÌte, jasn˝?
	AI_Output (self, other, "DIA_Alvares_ATTACK_Witz_11_01"); //A helemese, m·me tu novÈho hrdinu - a je to opravdov˝ blbec.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Witz_11_02"); //VÌö, co si myslÌm?
	AI_Output (other, self, "DIA_Alvares_ATTACK_Witz_15_03"); //Koho zajÌm·, co si myslÌö?
	AI_Output (self, other, "DIA_Alvares_ATTACK_Witz_11_04"); //MyslÌm, ûe dobr˝ hrdina je jedinÏ mrtv˝ hrdina. UdÏlej mi teda laskavost - chcÌpni co nejrychlejc!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);

};
FUNC VOID DIA_Alvares_ATTACK_Kerle()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Kerle_15_00"); //Co jste zaË? P·rek vtip·lk˘?
	AI_Output (self, other, "DIA_Alvares_ATTACK_Kerle_11_01"); //Tos uhodl. Ale po¯·dnÏ se zasmÏju, teprve aû budeö leûet drûkou v bl·tÏ.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Kerle_11_02"); //(vol·) Engardo, do toho! Ty chytni toho sedl·ka a j· se vypo¯·d·m s tÌmhle öaökem!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);

};
FUNC VOID DIA_Alvares_ATTACK_Aerger()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Aerger_15_00"); //NestojÌm o û·dnÈ problÈmy.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Aerger_11_01"); //A my zase m·me problÈmy moc r·di. Urazili jsme pÏkn˝ kus cesty, jenom abysme nÏjakÈ vyvolali.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Aerger_11_02"); //Jo, tÏch problÈm˘ nebude zrovna m·lo. A jestli okamûitÏ nezmizÌö, zaËneme rovnou s tebou.
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Alvares_ATTACK_Lieferung()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Lieferung_15_00"); //Jen jsem si p¯iöel nÏco vyzvednout.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Lieferung_11_01"); //To my taky, a my jsme tu byli prvnÌ. Takûe buÔ vypadneö, nebo ti budu muset ublÌûit.
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Alvares_ATTACK_Soeldner()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Soeldner_15_00"); //Chci se k v·m ûoldnÈ¯˘m p¯idat.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Soeldner_11_01"); //Ou, v·ûnÏ? Tak to koukej mazat, nebo uû se nikdy k nikomu nep¯id·ö.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Schluss
///////////////////////////////////////////////////////////////////////
instance DIA_Alvares_Schluss		(C_INFO)
{
	npc			 = 	SLD_840_Alvares;
	nr			 = 	4;
	condition	 = 	DIA_Alvares_Schluss_Condition;
	information	 = 	DIA_Alvares_Schluss_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Alvares_Schluss_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (Npc_KnowsInfo (other,DIA_Alvares_ATTACK))
	{
		return TRUE;
	};
};
func void DIA_Alvares_Schluss_Info ()
{
	AI_Output (self, other, "DIA_Alvares_Schluss_11_00"); //Dostal jsi öanci. Ale vypad· to, ûe rozumn˝ d˘vody prostÏ ignorujeö.
	AI_Output (self, other, "DIA_Alvares_Schluss_11_01"); //Jak chceö - tak to tÏ prostÏ teÔ hned zabiju. (vol·) Engardo, oddÏlej ho!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);	

	
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Alvares_PICKPOCKET (C_INFO)
{
	npc			= SLD_840_Alvares;
	nr			= 900;
	condition	= DIA_Alvares_PICKPOCKET_Condition;
	information	= DIA_Alvares_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Alvares_PICKPOCKET_Condition()
{
	C_Beklauen (20, 15);
};
 
FUNC VOID DIA_Alvares_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Alvares_PICKPOCKET);
	Info_AddChoice		(DIA_Alvares_PICKPOCKET, DIALOG_BACK 		,DIA_Alvares_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Alvares_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Alvares_PICKPOCKET_DoIt);
};

func void DIA_Alvares_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Alvares_PICKPOCKET);
};
	
func void DIA_Alvares_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Alvares_PICKPOCKET);
};


