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
		AI_Output(self,other,"DIA_Addon_Franco_EXIT_08_00");//Nesm� zabloudit, jinak si t� �raloci daj� jako z�kusek.
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
	description = "(Ukr�st tento amulet by bylo velice riskantn�)";
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
	B_LogEntry (Topic_Addon_Franco,"Kdy� pro Franca odvedu dobrou pr�ci, pust� m� do t�bora.");
	
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_00");//Hele, co tu d�l�? Chce� se dostat do t�bora?
	AI_Output (other,self,"DIA_Addon_Franco_HI_15_01");//Ano, chci.
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_02");//Je mi fuk, kdo jsi. J� jsem Franco a j� to tady vedu.
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_03");//Tak�e jestli chce� dobrou pr�ci, zavedu t� do t�bora.
	
	if (Ramon_News == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Franco_HI_08_04");//Vr�tn� Ramon m� p�ehled, jestli pot�ebujou nov� lidi. Promluv si s n�m.
		B_LogEntry (Topic_Addon_Franco,"M�m se optat vr�tn�ho Ramona, jestli v t�bo�e nepot�ebuj� n�koho nov�ho.");
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
	description = "Thorus pot�ebuje n�koho nov�ho.";
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
	
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_00");//Thorus pot�ebuje nov�ho �lov�ka.
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_01");//Fajn, postar�m se o to.
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_02");//Moment, a co j�?
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_03");//Tys je�t� nic neud�lal.
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_04");//U� jsem toho ud�lal spoustu, akor�t �e o tom nev�.
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_05");//No, jestli chce� �anci, tak ji dostane�. Zvedni zadek a zajdi za Loganem. Mo��lov� �raloci u� mu dejchaj za krk.
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_06");//Pomoz mu ty potvory pob�t a bude to skoro stejn�, jako kdybys byl v t�bo�e.
	
	B_LogEntry (Topic_Addon_Franco,"Franco chce, abych nap�ed pomohl Loganovi. Teprve pak m� pust� do t�bora.");
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
	AI_Output (self,other,"DIA_Addon_Franco_Wo_08_01");//Kdy� se postav� p�ed vchod do t�bora, dej se pod�l kamenn� st�ny nalevo. Je to kousek d�l v ba�in�.
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
	description = "Logan je mrtv�.";
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
	AI_Output (other,self,"DIA_Addon_Franco_tot_15_00");//Logan je mrtv�.
	AI_Output (self,other,"DIA_Addon_Franco_tot_08_01");//Sakra. Byl to nejlep�� lovec, jak�ho jsme tu m�li. Zatracen� v�c!
	AI_Output (self,other,"DIA_Addon_Franco_tot_08_02");//Ale stejn� u� jsem do t�bora poslal n�koho jin�ho.
	
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
		AI_Output (other,self,"DIA_Addon_Franco_HaiSuccess_15_01");//ale nep�e�il to.
	};
	AI_Output (self,other,"DIA_Addon_Franco_HaiSuccess_08_02");//No dob�e, tak jsi pobil p�r mo��lovejch �ralok� � p�ece jenom nejsi �plnej budi�kni�emu. Aspo� jsi lep�� ne� v�t�ina zdej��ch chlap�.
	B_GivePlayerXP (XP_Addon_HlpLogan);
	
	B_LogEntry (Topic_Addon_Franco,"Sice jsem pomohl Loganovi, ale Francovi to nesta�ilo a st�le m� nechce poslat do t�bora.");
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
	description = "Tak m��u u� j�t do t�bora?";
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
	AI_Output (other,self,"DIA_Addon_Franco_MIS2_15_00");//Tak m��u u� te� do t�bora?
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_01");//Hele, pot�ebuju od tebe je�t� jednu v�c.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_02");//P�ed p�r dny jsem poslal do ba�in Egora.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_03");//M�l mi naj�t starou kamennou tabulku, ale je�t� se nevr�til.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_04");//Zjisti, co d�l�, a tu zatracenou tabulku mi dones.
	
	MIS_HlpEdgor = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_Stoneplate,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Stoneplate,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Stoneplate,"Franco chce kamennou tabulku, kterou mu m�l p�in�st Edgor. Te� to m�m vy��dit j�.");
	
	B_LogEntry (Topic_Addon_Franco,"Franco chce, abych pomohl Edgorovi. Teprve pak m� po�le do t�bora.");
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
	AI_Output (self,other,"DIA_Addon_Franco_While_08_01");//Co�e?
	AI_Output (other,self,"DIA_Addon_Franco_While_15_02");//Dostanu tu za pr�ci v ba�in� n�co zaplaceno?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_03");//(mimo��dn� p��telsky) Cht�l bys zlato? Ale jist�, kolik by sis tak p�edstavoval? Pades�t zlatejch nugget�? Nebo stovku? D�m ti tolik, kolik unese�...
	AI_Output (self,other,"DIA_Addon_Franco_While_08_04");//(nahlas) Kdo si mysl� �e jsi? D�l� si ze m� bl�zny?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_05");//Tak vypal a koukej n�co d�lat! Jinak nedostane� ANI DROBEK zlata!
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
	description = "Tak KDE m�m teda toho Edgora hledat?";
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
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_08_01"); //Chce� v�d�t, jak to ud�lat rychle, nebo jednodu�e.
	
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
	Info_AddChoice (DIA_Addon_Franco_WOEDGOR, "Vy��d�m to rychle." ,DIA_Addon_Franco_WOEDGOR_Fast);
	Info_AddChoice (DIA_Addon_Franco_WOEDGOR, "Jak� je ten snadn� zp�sob?" ,DIA_Addon_Franco_WOEDGOR_Easy);
};

func void B_Addon_Franco_There()
{
	AI_Output (self,other,"DIA_Addon_Franco_There_08_00"); //Je to tu sam� rozvalina. N�kde tam posed�v�.
	AI_Output (self,other,"DIA_Addon_Franco_There_08_01"); //Po��t�m, �e byl dost chytrej, aby si rozd�lal ohe�. Aspo� TEN bys moh naj�t.
};

func void DIA_Addon_Franco_WOEDGOR_Easy()
{
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_Easy_15_00"); //Jak� je ten jednoduch� zp�sob?
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_01"); //B� po cest� od p�edn� br�ny. N�kde by tam m�l post�vat Sancho.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_02"); //Tam zabo� vlevo a dr� se na chodn�ku.
	
	B_Addon_Franco_There();
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
};

func void DIA_Addon_Franco_WOEDGOR_Fast()
{
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_Fast_15_00"); //Byl bych pro rychl� �e�en�.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Fast_08_01"); //Fajn. Odsud vyra� �hlop���n� p�es chodn�k a� do ba�iny.
	
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
	description = "Tady m� tu kamennou tabulku.";
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
	AI_Output (other,self,"DIA_Addon_Franco_tafel_15_00");//Tam najde� kamennou tabulku.
	B_GiveInvItems (other, self, ItMi_Addon_Stone_04,1);
	
	AI_Output (self,other,"DIA_Addon_Franco_tafel_08_01");//Dob�e, velmi dob�e. Havran z tebe bude m�t radost.
	MIS_HlpEdgor = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_HlpEdgor);
	
	B_LogEntry (Topic_Addon_Franco,"P�inesl jsem Francovi kamennou tabulku, kterou po mn� cht�l.");
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
	description = "A co bude teda s t�m t�borem? U� m� tam kone�n� pust�?";
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
	AI_Output (other,self,"DIA_Addon_Franco_JemandAnderen_15_00");//A co bude s t�m t�borem? M��u u� kone�n� dovnit�?
	
	if !Npc_IsDead (Logan)
	{
		AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_01");//Ne, u� jsem tam poslal Logana. Byl na seznamu p�ed tebou.
		
		Logan_Inside = TRUE;
		AI_Teleport (Logan,"BL_INN_CORNER_02");
		B_StartOtherRoutine (Logan,"LAGER");
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_02");//Ne, u� jsem tam poslal n�koho jin�ho.
	};
	
	AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_03");//A zrovna te� u� v t�bo�e nikoho dal��ho nepot�ebujou.
	AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_04");//Krom toho bych t� fakt vyu�il tady, (�kleb� se), kdy� u� tu nen� Logan.
		
	B_LogEntry (Topic_Addon_Franco,"Franco m� do t�bora prost� nepust�. Mysl�m, �e mu to budu muset vysv�tlit ru�n�.");
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
	description = "Po�li m� tam. HNED!";
};
FUNC INT DIA_Addon_Franco_Fight_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Franco_Fight_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_Fight_15_00"); //OKAM�IT� m� tam po�li!
	AI_Output (self,other,"DIA_Addon_Franco_Fight_08_01"); //(nebezpe�n� p��telsky) A co kdy� �eknu ne?
	
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	Info_AddChoice (DIA_Addon_Franco_Fight, "Tak teda je�t� chv�li po�k�m." ,DIA_Addon_Franco_Fight_Nothing);
	Info_AddChoice (DIA_Addon_Franco_Fight, "Tak toho bude� litovat." ,DIA_Addon_Franco_Fight_Duel);
};

func void DIA_Addon_Franco_Fight_Duel()
{
	AI_Output (other,self,"DIA_Addon_Franco_Fight_Duel_15_00"); //Pak toho bude� prost� litovat.
	AI_Output (self,other,"DIA_Addon_Franco_Fight_Duel_08_01"); //Ty se mi opova�uje� vyhro�ovat? TY chce� vyhro�ovat MN�? Tak to si koleduje� vo po��dnou lekci!
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};

func void DIA_Addon_Franco_Fight_Nothing()
{
	AI_Output (other,self,"DIA_Addon_Franco_Fight_Nothing_15_00"); //Tak to si bude� muset po�kat.
	AI_Output (self,other,"DIA_Addon_Franco_Fight_Nothing_08_01"); //(posm�n�) P�esn� tak.
	
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
	description = "Ty hajzle! Za tohle t� dostanu!";
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
	AI_Output (other,self,"DIA_Addon_Franco_Pig_15_00");//Ty svin�! J� t� dostanu!
	AI_Output (self,other,"DIA_Addon_Franco_Pig_08_01");//(podr�d�n�) Ty mizernej malej ubo��ku, ty si dovoluje� na m�? Jen po�kej!
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};




