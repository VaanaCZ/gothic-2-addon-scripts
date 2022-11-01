///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Franco_EXIT   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 999;
	condition   = DIA_Addon_Franco_EXIT_Condition;
	information = DIA_Addon_Franco_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Franco_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Franco_EXIT_Info()
{
	if (Franco_Exit == FALSE)
	&& (MIS_HlpLogan == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Franco_EXIT_08_00");//Nesmíš zabloudit, jinak si tę žraloci dají jako zákusek.
		Franco_Exit = TRUE;
	};
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Franco_PICKPOCKET (C_INFO)
{
	npc			= BDT_1093_Addon_Franco;
	nr			= 900;
	condition	= DIA_Franco_PICKPOCKET_Condition;
	information	= DIA_Franco_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ukrást tento amulet by bylo velice riskantní)";
};                       

FUNC INT DIA_Franco_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (60 - Theftdiff)
	&& (Npc_HasItems (self,ItAm_Addon_Franco) >= 1))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Franco_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Franco_PICKPOCKET);
	Info_AddChoice		(DIA_Franco_PICKPOCKET, DIALOG_BACK 		,DIA_Franco_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Franco_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Franco_PICKPOCKET_DoIt);
};

func void DIA_Franco_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 60)
	{
		B_GiveInvItems (self, other, ItAm_Addon_Franco, 1);
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Franco_PICKPOCKET);
		
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		self.attribute[ATR_HITPOINTS_MAX]	= 196; //boah ey, ist ja ein super trick!
		self.attribute[ATR_HITPOINTS] 		= 196;
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
		
		
	};
};
	
func void DIA_Franco_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Franco_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info HI
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_HI   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 1;
	condition   = DIA_Addon_Franco_HI_Condition;
	information = DIA_Addon_Franco_HI_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Franco_HI_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_Franco_HI_Info()
{	
	Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Franco,"Když pro Franca odvedu dobrou práci, pustí mę do tábora.");
	
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_00");//Hele, co tu dęláš? Chceš se dostat do tábora?
	AI_Output (other,self,"DIA_Addon_Franco_HI_15_01");//Ano, chci.
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_02");//Je mi fuk, kdo jsi. Já jsem Franco a já to tady vedu.
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_03");//Takže jestli chceš dobrou práci, zavedu tę do tábora.
	
	if (Ramon_News == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Franco_HI_08_04");//Vrátný Ramon má pâehled, jestli potâebujou nový lidi. Promluv si s ním.
		B_LogEntry (Topic_Addon_Franco,"Mám se optat vrátného Ramona, jestli v táboâe nepotâebují nękoho nového.");
	};
};
//---------------------------------------------------------------------
//	Info Mission SumpfHai
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Hai   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 2;
	condition   = DIA_Addon_Franco_Hai_Condition;
	information = DIA_Addon_Franco_Hai_Info;
	permanent   = FALSE;
	description = "Thorus potâebuje nękoho nového.";
};
FUNC INT DIA_Addon_Franco_Hai_Condition()
{	
	if (Ramon_News == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Hai_Info()
{	
	
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_00");//Thorus potâebuje novýho človęka.
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_01");//Fajn, postarám se o to.
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_02");//Moment, a co já?
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_03");//Tys ještę nic neudęlal.
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_04");//Už jsem toho udęlal spoustu, akorát že o tom nevíš.
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_05");//No, jestli chceš šanci, tak ji dostaneš. Zvedni zadek a zajdi za Loganem. Močáloví žraloci už mu dejchaj za krk.
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_06");//Pomoz mu ty potvory pobít a bude to skoro stejný, jako kdybys byl v táboâe.
	
	B_LogEntry (Topic_Addon_Franco,"Franco chce, abych napâed pomohl Loganovi. Teprve pak mę pustí do tábora.");
};
//---------------------------------------------------------------------
//	Info Logan Wo?
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Wo   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 3;
	condition   = DIA_Addon_Franco_Wo_Condition;
	information = DIA_Addon_Franco_Wo_Info;
	permanent   = FALSE;
	description = "Kde toho Logana najdu?";
};
FUNC INT DIA_Addon_Franco_Wo_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Franco_Hai))
	&& (!Npc_IsDead (Logan))
	&& (MIS_HlpLogan == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Wo_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_Wo_15_00");//Kde toho Logana najdu?
	AI_Output (self,other,"DIA_Addon_Franco_Wo_08_01");//Když se postavíš pâed vchod do tábora, dej se podél kamenný stęny nalevo. Je to kousek dál v bažinę.
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Logan tot
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_tot   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 5;
	condition   = DIA_Addon_Franco_tot_Condition;
	information = DIA_Addon_Franco_tot_Info;
	permanent   = FALSE;
	description = "Logan je mrtvý.";
};
FUNC INT DIA_Addon_Franco_tot_Condition()
{	
	if (MIS_HlpLogan != LOG_SUCCESS)
	&&  Npc_IsDead (Logan)
	&& Npc_KnowsInfo (other,DIA_Addon_Franco_Hai)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_tot_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_tot_15_00");//Logan je mrtvý.
	AI_Output (self,other,"DIA_Addon_Franco_tot_08_01");//Sakra. Byl to nejlepší lovec, jakýho jsme tu męli. Zatracená vęc!
	AI_Output (self,other,"DIA_Addon_Franco_tot_08_02");//Ale stejnę už jsem do tábora poslal nękoho jinýho.
	
	if (MIS_HlpLogan == LOG_RUNNING)
	{
		MIS_HlpLogan = LOG_OBSOLETE;
		B_CheckLog();
	};
};
//---------------------------------------------------------------------
//	Info Logan Success HAISUCCESS
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_HaiSuccess   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 6;
	condition   = DIA_Addon_Franco_HaiSuccess_Condition;
	information = DIA_Addon_Franco_HaiSuccess_Info;
	permanent   = FALSE;
	description = "Pomohl jsem Loganovi...";
};
FUNC INT DIA_Addon_Franco_HaiSuccess_Condition()
{	
	if (MIS_HlpLogan == LOG_SUCCESS)
	&& Npc_KnowsInfo (other,DIA_Addon_Franco_Hai)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_HaiSuccess_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_HaiSuccess_15_00");//Pomohl jsem Loganovi,
	
	if Npc_IsDead (Logan)
	{
		AI_Output (other,self,"DIA_Addon_Franco_HaiSuccess_15_01");//ale nepâežil to.
	};
	AI_Output (self,other,"DIA_Addon_Franco_HaiSuccess_08_02");//No dobâe, tak jsi pobil pár močálovejch žraloků – pâece jenom nejsi úplnej budižkničemu. Aspoŕ jsi lepší než vętšina zdejších chlapů.
	B_GivePlayerXP (XP_Addon_HlpLogan);
	
	B_LogEntry (Topic_Addon_Franco,"Sice jsem pomohl Loganovi, ale Francovi to nestačilo a stále mę nechce poslat do tábora.");
};

//---------------------------------------------------------------------
//	Mis 2 (Edgor)
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Mis2 (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 7;
	condition   = DIA_Addon_Franco_Mis2_Condition;
	information = DIA_Addon_Franco_Mis2_Info;
	permanent   = FALSE;
	description = "Tak můžu už jít do tábora?";
};
FUNC INT DIA_Addon_Franco_Mis2_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Franco_HaiSuccess))
	|| (Npc_KnowsInfo (other, DIA_Addon_Franco_tot))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Mis2_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_MIS2_15_00");//Tak můžu už teë do tábora?
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_01");//Hele, potâebuju od tebe ještę jednu vęc.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_02");//Pâed pár dny jsem poslal do bažin Egora.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_03");//Męl mi najít starou kamennou tabulku, ale ještę se nevrátil.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_04");//Zjisti, co dęlá, a tu zatracenou tabulku mi dones.
	
	MIS_HlpEdgor = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_Stoneplate,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Stoneplate,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Stoneplate,"Franco chce kamennou tabulku, kterou mu męl pâinést Edgor. Teë to mám vyâídit já.");
	
	B_LogEntry (Topic_Addon_Franco,"Franco chce, abych pomohl Edgorovi. Teprve pak mę pošle do tábora.");
};

//---------------------------------------------------------------------
//	Info Logan While
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_While   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 8;
	condition   = DIA_Addon_Franco_While_Condition;
	information = DIA_Addon_Franco_While_Info;
	permanent   = FALSE;
	description = "A co takhle zlato?";
};
FUNC INT DIA_Addon_Franco_While_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Franco_HaiSuccess))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_While_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_While_15_00");//A co takhle zlato?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_01");//Cože?
	AI_Output (other,self,"DIA_Addon_Franco_While_15_02");//Dostanu tu za práci v bažinę nęco zaplaceno?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_03");//(mimoâádnę pâátelsky) Chtęl bys zlato? Ale jistę, kolik by sis tak pâedstavoval? Padesát zlatejch nuggetů? Nebo stovku? Dám ti tolik, kolik uneseš...
	AI_Output (self,other,"DIA_Addon_Franco_While_08_04");//(nahlas) Kdo si myslíš že jsi? Dęláš si ze mę blázny?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_05");//Tak vypal a koukej nęco dęlat! Jinak nedostaneš ANI DROBEK zlata!
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info WOEDGOR
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_WOEDGOR   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 9;
	condition   = DIA_Addon_Franco_WOEDGOR_Condition;
	information = DIA_Addon_Franco_WOEDGOR_Info;
	permanent   = TRUE;
	description = "Tak KDE mám teda toho Edgora hledat?";
};
FUNC INT DIA_Addon_Franco_WOEDGOR_Condition()
{	
	if (MIS_HlpEdgor == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_Addon_Stone_04 ) < 1)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_WOEDGOR_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_15_00"); //(povzdech) Tak KDE najdu toho Edgora?
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_08_01"); //Chceš vędęt, jak to udęlat rychle, nebo jednoduše.
	
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
	Info_AddChoice (DIA_Addon_Franco_WOEDGOR, "Vyâídím to rychle." ,DIA_Addon_Franco_WOEDGOR_Fast);
	Info_AddChoice (DIA_Addon_Franco_WOEDGOR, "Jaký je ten snadný způsob?" ,DIA_Addon_Franco_WOEDGOR_Easy);
};

func void B_Addon_Franco_There()
{
	AI_Output (self,other,"DIA_Addon_Franco_There_08_00"); //Je to tu samá rozvalina. Nękde tam posedává.
	AI_Output (self,other,"DIA_Addon_Franco_There_08_01"); //Počítám, že byl dost chytrej, aby si rozdęlal oheŕ. Aspoŕ TEN bys moh najít.
};

func void DIA_Addon_Franco_WOEDGOR_Easy()
{
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_Easy_15_00"); //Jaký je ten jednoduchý způsob?
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_01"); //Bęž po cestę od pâední brány. Nękde by tam męl postávat Sancho.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_02"); //Tam zaboč vlevo a drž se na chodníku.
	
	B_Addon_Franco_There();
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
};

func void DIA_Addon_Franco_WOEDGOR_Fast()
{
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_Fast_15_00"); //Byl bych pro rychlé âešení.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Fast_08_01"); //Fajn. Odsud vyraž úhlopâíčnę pâes chodník až do bažiny.
	
	B_Addon_Franco_There();
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
};
//---------------------------------------------------------------------
//	Info tafel
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_tafel   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 10;
	condition   = DIA_Addon_Franco_tafel_Condition;
	information = DIA_Addon_Franco_tafel_Info;
	permanent   = FALSE;
	description = "Tady máš tu kamennou tabulku.";
};
FUNC INT DIA_Addon_Franco_tafel_Condition()
{	
	if (Npc_HasItems (other,ItMi_Addon_Stone_04 ) >= 1)
	&& (MIS_HlpEdgor == LOG_RUNNING)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_tafel_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_tafel_15_00");//Tam najdeš kamennou tabulku.
	B_GiveInvItems (other, self, ItMi_Addon_Stone_04,1);
	
	AI_Output (self,other,"DIA_Addon_Franco_tafel_08_01");//Dobâe, velmi dobâe. Havran z tebe bude mít radost.
	MIS_HlpEdgor = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_HlpEdgor);
	
	B_LogEntry (Topic_Addon_Franco,"Pâinesl jsem Francovi kamennou tabulku, kterou po mnę chtęl.");
};

//---------------------------------------------------------------------
//	JemandAnderen
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_JemandAnderen   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 11;
	condition   = DIA_Addon_Franco_JemandAnderen_Condition;
	information = DIA_Addon_Franco_JemandAnderen_Info;
	permanent   = FALSE;
	description = "A co bude teda s tím táborem? Už mę tam konečnę pustíš?";
};
FUNC INT DIA_Addon_Franco_JemandAnderen_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Franco_tafel))
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_JemandAnderen_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_JemandAnderen_15_00");//A co bude s tím táborem? Můžu už konečnę dovnitâ?
	
	if !Npc_IsDead (Logan)
	{
		AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_01");//Ne, už jsem tam poslal Logana. Byl na seznamu pâed tebou.
		
		Logan_Inside = TRUE;
		AI_Teleport (Logan,"BL_INN_CORNER_02");
		B_StartOtherRoutine (Logan,"LAGER");
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_02");//Ne, už jsem tam poslal nękoho jinýho.
	};
	
	AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_03");//A zrovna teë už v táboâe nikoho dalšího nepotâebujou.
	AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_04");//Krom toho bych tę fakt využil tady, (šklebí se), když už tu není Logan.
		
	B_LogEntry (Topic_Addon_Franco,"Franco mę do tábora prostę nepustí. Myslím, že mu to budu muset vysvętlit ručnę.");
};

//---------------------------------------------------------------------
//	Info Fight
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Fight   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 12;
	condition   = DIA_Addon_Franco_Fight_Condition;
	information = DIA_Addon_Franco_Fight_Info;
	permanent   = TRUE;
	description = "Pošli mę tam. HNED!";
};
FUNC INT DIA_Addon_Franco_Fight_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Franco_Fight_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_Fight_15_00"); //OKAMŽITĘ mę tam pošli!
	AI_Output (self,other,"DIA_Addon_Franco_Fight_08_01"); //(nebezpečnę pâátelsky) A co když âeknu ne?
	
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	Info_AddChoice (DIA_Addon_Franco_Fight, "Tak teda ještę chvíli počkám." ,DIA_Addon_Franco_Fight_Nothing);
	Info_AddChoice (DIA_Addon_Franco_Fight, "Tak toho budeš litovat." ,DIA_Addon_Franco_Fight_Duel);
};

func void DIA_Addon_Franco_Fight_Duel()
{
	AI_Output (other,self,"DIA_Addon_Franco_Fight_Duel_15_00"); //Pak toho budeš prostę litovat.
	AI_Output (self,other,"DIA_Addon_Franco_Fight_Duel_08_01"); //Ty se mi opovažuješ vyhrožovat? TY chceš vyhrožovat MNĘ? Tak to si koleduješ vo poâádnou lekci!
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};

func void DIA_Addon_Franco_Fight_Nothing()
{
	AI_Output (other,self,"DIA_Addon_Franco_Fight_Nothing_15_00"); //Tak to si budeš muset počkat.
	AI_Output (self,other,"DIA_Addon_Franco_Fight_Nothing_08_01"); //(posmęšnę) Pâesnę tak.
	
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info Fight2
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Pig   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 13;
	condition   = DIA_Addon_Franco_Pig_Condition;
	information = DIA_Addon_Franco_Pig_Info;
	permanent   = TRUE;
	description = "Ty hajzle! Za tohle tę dostanu!";
};
FUNC INT DIA_Addon_Franco_Pig_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Franco_JemandAnderen))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Pig_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_Pig_15_00");//Ty svinę! Já tę dostanu!
	AI_Output (self,other,"DIA_Addon_Franco_Pig_08_01");//(podráždęnę) Ty mizernej malej ubožáku, ty si dovoluješ na mę? Jen počkej!
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};




