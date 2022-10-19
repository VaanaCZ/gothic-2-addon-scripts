// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Richter_EXIT(C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 999;
	condition	= DIA_Richter_EXIT_Condition;
	information	= DIA_Richter_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Richter_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Richter_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hello 
// ************************************************************

INSTANCE DIA_Richter_Hello(C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 4;
	condition	= DIA_Richter_Hello_Condition;
	information	= DIA_Richter_Hello_Info;
	permanent	= FALSE;
	description = "Co tady dìláš?";
};                       

FUNC INT DIA_Richter_Hello_Condition()
{
	if (MIS_Lee_JudgeRichter == 0)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Richter_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Richter_Hello_15_00"); //Co tady dìláš?
	AI_Output (self ,other,"DIA_Richter_Hello_10_01"); //Proè mì obtìžuješ? Kdo vlastnì jsi?
	AI_Output (other,self ,"DIA_Richter_Hello_15_02"); //Já, ehm...
	AI_Output (self ,other,"DIA_Richter_Hello_10_03"); //Øekni, neznáme se odnìkud?
	
	Info_ClearChoices (DIA_Richter_Hello);
	Info_AddChoice (DIA_Richter_Hello,"Co si pamatuju, tak ne.",DIA_Richter_Hello_DontThinkSo);
	Info_AddChoice (DIA_Richter_Hello,"Možná ano.",DIA_Richter_Hello_MayBe);
};

FUNC VOID DIA_Richter_Hello_DontThinkSo ()
{
	AI_Output (other,self ,"DIA_Richter_Hello_DontThinkSo_15_00"); //Co si pamatuju, tak ne.
	AI_Output (self ,other,"DIA_Richter_Hello_DontThinkSo_10_01"); //To je zvláštní. Pøísahal bych, že už jsme se nìkde vidìli.
	AI_Output (self ,other,"DIA_Richter_Hello_DontThinkSo_10_02"); //Nevadí, však jsi jen ubohý šupák. Všichni vypadáte stejnì.
};

FUNC VOID DIA_Richter_Hello_MayBe ()
{
	AI_Output (other,self ,"DIA_Richter_Hello_MayBe_15_00"); //Možná ano.
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_01"); //Chtìlo by to trochu uctivìjší tón! S kým si vùbec myslíš, že mluvíš?
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_02"); //To nejmenší, co mùžeš udìlat, je mluvit se mnou odpovídajícím tónem.
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_03"); //A teï se mi ztra z oèí!
	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Perm 
// ************************************************************

INSTANCE DIA_Richter_Perm(C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 800;
	condition	= DIA_Richter_Perm_Condition;
	information	= DIA_Richter_Perm_Info;
	permanent	= TRUE;
	description = "Jak to jde?";
};                       

FUNC INT DIA_Richter_Perm_Condition()
{
	if ((Npc_KnowsInfo (other,DIA_Richter_Hello)) || (MIS_Lee_JudgeRichter == LOG_RUNNING))
	&& (SCIstRichtersLakai == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_Perm_Info()
{	
	AI_Output (other,self ,"DIA_Richter_Perm_15_00"); //Jak se vede?

	if (MIS_Lee_JudgeRichter == LOG_RUNNING)
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG ))
	{
		AI_Output (self ,other,"DIA_Richter_Perm_10_01"); //Radìji bys mìl vypadnout, ty mizernej žoldáku, než zavolám stráže.
		AI_Output (other,self ,"DIA_Richter_Perm_15_02"); //Klídek. Nepøišel jsem tì okrást. Hledám práci.
		AI_Output (self ,other,"DIA_Richter_Perm_10_03"); //Á. Tak ty pro mì chceš pracovat. Tak to je samozøejmì jiná.
		AI_Output (self ,other,"DIA_Richter_Perm_10_04"); //Ale má to jeden háèek. Nevím, jestli ti mohu vìøit. Budeš mi muset nejprve prokázat svou loajalitu.
		SCIstRichtersLakai = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Richter_Perm_10_05"); //Neøekl jsem snad jasnì, že s tebou nechci nic mít?
		AI_Output (other,self ,"DIA_Richter_Perm_15_06"); //Ne, ne tolika slovy.
		AI_Output (self ,other,"DIA_Richter_Perm_10_07"); //Tak doufám, že ti to došlo teï.
	};
};

// ************************************************************
// 			  				   RichtersLakai 
// ************************************************************

INSTANCE DIA_Richter_RichtersLakai (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_RichtersLakai_Condition;
	information	= DIA_Richter_RichtersLakai_Info;

	description = "Otestuj si mì.";
};                       

FUNC INT DIA_Richter_RichtersLakai_Condition()
{
	if ((Npc_KnowsInfo (other,DIA_Richter_Hello)) || (MIS_Lee_JudgeRichter != 0))
	&& (SCIstRichtersLakai == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_RichtersLakai_Info()
{	
	AI_Output (other,self ,"DIA_Richter_RichtersLakai_15_00"); //Otestuj si mì.
	AI_Output (self ,other,"DIA_Richter_RichtersLakai_10_01"); //Mmh. Dobrá. Poslouchej. Pøines mi od ohnivých mágù posvátné kladivo. Ukrývají ho nìkde v podzemí svého kláštera.
	AI_Output (self ,other,"DIA_Richter_RichtersLakai_10_02"); //Jestli to dokážeš splnit, možná budu uvažovat o tom, že bych si tì najal jako svého osobního strážce.
	
	Info_ClearChoices	(DIA_Richter_RichtersLakai);
	Info_AddChoice	(DIA_Richter_RichtersLakai, "To mám jako okrást mágy? Nejsi trochu mimo?", DIA_Richter_RichtersLakai_nein );
	Info_AddChoice	(DIA_Richter_RichtersLakai, "Dobrá.", DIA_Richter_RichtersLakai_ja );
	
	B_LogEntry (TOPIC_RichterLakai,"Soudce mi nevìøí. Musím mu prokázat svou loajalitu - ukrást ze sklepení kláštera ohnivých mágù posvátné kladivo a pøinést mu je."); 

	MIS_Richter_BringHolyHammer = LOG_RUNNING;
};
func void DIA_Richter_RichtersLakai_nein ()
{
	AI_Output			(other, self, "DIA_Richter_RichtersLakai_nein_15_00"); //To mám jako okrást mágy? Nejsi trochu mimo?
	AI_Output			(self, other, "DIA_Richter_RichtersLakai_nein_10_01"); //V tom pøípadì táhni do pekel a pøestaò plýtvat mým èasem.
	AI_StopProcessInfos (self);
};

func void DIA_Richter_RichtersLakai_ja ()
{
	AI_Output			(other, self, "DIA_Richter_RichtersLakai_ja_15_00"); //Dobrá.
	AI_Output			(self, other, "DIA_Richter_RichtersLakai_ja_10_01"); //Fajn. Ale pamatuj - jestli tì chytí, nikdy jsem o tobì neslyšel.
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				   KillMorgahard 
// ************************************************************

INSTANCE DIA_Richter_KillMorgahard (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_KillMorgahard_Condition;
	information	= DIA_Richter_KillMorgahard_Info;

	description =	"Tady je posvátné kladivo mágù.";
};                       

FUNC INT DIA_Richter_KillMorgahard_Condition()
{
	if (Npc_HasItems (other,Holy_Hammer_MIS))
	&& (MIS_Richter_BringHolyHammer == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_KillMorgahard_Info()
{	
	AI_Output (other,self ,"DIA_Richter_KillMorgahard_15_00"); //Tady je posvátné kladivo mágù.
	B_GiveInvItems (other, self, Holy_Hammer_MIS,1);
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_01"); //Jsem opravdu pøekvapený. Ty to myslíš vážnì, co? Tady je tvá odmìna.
	CreateInvItems (self, ItMi_Gold, 300);									
	B_GiveInvItems (self, other, ItMi_Gold, 300);					
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_02"); //Fajn. Když se to má takhle, tak to mám pro tebe ještì další úkol.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_03"); //Pøed nìkolika dny uteklo ze zdejšího vìzení pár trestancù.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_04"); //Ti zkurvysyni se schovali v horách. Nìkde smìrem ke Xardasovì nové vìži.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_05"); //Jejich vùdce se jmenuje Morgahard. Chci, abys ho zabil.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_06"); //Pospìš si, než nám proklouzne.
	
	Wld_InsertNpc	(BDT_1030_Morgahard,"REICH"); 
	Wld_InsertNpc	(BDT_1031_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1032_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1033_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1034_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1035_Fluechtling,"REICH"); 

	B_InitNpcGlobals ();

	B_GivePlayerXP (XP_BringHolyHammer);
	MIS_Richter_BringHolyHammer = LOG_SUCCESS;
	B_LogEntry (TOPIC_RichterLakai,"Nìkteøí vìzni unikli spravedlnosti. Já je mám dostihnout a zabít jejich velitele Morgaharda. Nejspíš se ukrývají v horách, kdesi smìrem ke Xardasovì nové vìži."); 
	MIS_Richter_KillMorgahard = LOG_RUNNING;
	AI_StopProcessInfos (self);
};	

// ************************************************************
// 	  KilledMorgahard 
// ************************************************************

INSTANCE DIA_Richter_KilledMorgahard (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_KilledMorgahard_Condition;
	information	= DIA_Richter_KilledMorgahard_Info;

	description =	"Morgahard je mrtvý.";
};                       

FUNC INT DIA_Richter_KilledMorgahard_Condition()
{
	if (Npc_IsDead(Morgahard))
	&& (MIS_Richter_KillMorgahard == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_KilledMorgahard_Info()
{	
	AI_Output (other,self ,"DIA_Richter_KilledMorgahard_15_00"); //Morgahard je mrtvý.
	AI_Output (self ,other,"DIA_Richter_KilledMorgahard_10_01"); //Á. Jsi dobrej chlap. Tady je tvoje odmìna.
	CreateInvItems (self, ItMi_Gold, 400);									
	B_GiveInvItems (self, other, ItMi_Gold, 400);					
	B_GivePlayerXP (XP_KillMorgahard);
	B_LogEntry (TOPIC_RichterLakai,"Soudce byl zprávou o Morgahardovì smrti oèividnì nadšen. No, nechme ho být. Nesmím odboèovat od poslání, kterým mì povìøil Lee."); 
	MIS_Richter_KillMorgahard = LOG_SUCCESS;
};

// ************************************************************
// 	  KilledMorgahardPERM 
// ************************************************************

INSTANCE DIA_Richter_KilledMorgahardPERM (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_KilledMorgahardPERM_Condition;
	information	= DIA_Richter_KilledMorgahardPERM_Info;
	permanent	 = 	TRUE;

	description =	"Mùžu pro tebe ještì nìco udìlat?";
};                       

FUNC INT DIA_Richter_KilledMorgahardPERM_Condition()
{
	if (MIS_Richter_KillMorgahard == LOG_SUCCESS)
	&& (MIS_RichtersPermissionForShip == 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_KilledMorgahardPERM_Info ()
{	
	AI_Output (other,self ,"DIA_Richter_KilledMorgahardPERM_15_00"); //Mùžu pro tebe ještì nìco udìlat?
	AI_Output (self ,other,"DIA_Richter_KilledMorgahardPERM_10_01"); //Teï zrovna ne. Možná pozdìji.
};

// ************************************************************
// 		 PermissionForShip 
// ************************************************************

INSTANCE DIA_Richter_PermissionForShip (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_PermissionForShip_Condition;
	information	= DIA_Richter_PermissionForShip_Info;

	description =	"Dej mi písemné povìøení pro paladinskou loï.";
};                       

FUNC INT DIA_Richter_PermissionForShip_Condition()
{
	if (MIS_RichtersPermissionForShip == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_PermissionForShip_Info ()
{	
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_00"); //Dej mi písemné povìøení pro paladinskou loï.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_01"); //(smích) Ty ses musel zbláznit. Co to po mnì chceš?
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_02"); //Slyšel jsi dobøe. Dej mi to písemné oprávnìní, nebo tì prásknu domobranì.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_03"); //(vrèí) Nenechám se vydírat! Ne od tebe! Nechám tì sežrat vlkùm, ty mizernej šmejde.
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_04"); //Morgahard napadl místodržícího na tvùj rozkaz. Mám dokument, který to dokazuje.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_05"); //(vrèí) Arrh.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_06"); //Toho budeš litovat. Nikdo mì nebude vydírat, aniž by z toho vyváznul se zdravou kùží.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_07"); //Tady je to oprávnìní. A teï vypadni. Vyøídím si to s tebou pozdìji.
	CreateInvItems (self,ItWr_ForgedShipLetter_Mis,1);
	B_GiveInvItems (self,other,ItWr_ForgedShipLetter_Mis,1);
	B_LogEntry (TOPIC_Ship,"S plnou mocí v kapse mohu získat loï, než bys øekl švec. Jsem zvìdavý, co tomu øekne Lee."); 
	MIS_RichtersPermissionForShip = LOG_SUCCESS;
	B_GivePlayerXP (XP_RichtersPermissionForShip);
};

// ************************************************************
// 		 perm2 
// ************************************************************

INSTANCE DIA_Richter_perm2 (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_perm2_Condition;
	information	= DIA_Richter_perm2_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};                       

FUNC INT DIA_Richter_perm2_Condition()
{
	if (MIS_RichtersPermissionForShip == LOG_SUCCESS)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

FUNC VOID DIA_Richter_perm2_Info ()
{	
	AI_Output (self ,other,"DIA_Richter_perm2_10_00"); //Ztra se mi z oèí.
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Richter_PICKPOCKET (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 900;
	condition	= DIA_Richter_PICKPOCKET_Condition;
	information	= DIA_Richter_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Tento klíè pùjde ukrást snadno.)";
};                       

FUNC INT DIA_Richter_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_Richter) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Richter_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Richter_PICKPOCKET);
	Info_AddChoice		(DIA_Richter_PICKPOCKET, DIALOG_BACK 		,DIA_Richter_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Richter_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Richter_PICKPOCKET_DoIt);
};

func void DIA_Richter_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems (self, other, ItKe_Richter, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();	
		Info_ClearChoices (DIA_Richter_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); 
	};
};
	
func void DIA_Richter_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Richter_PICKPOCKET);
};




