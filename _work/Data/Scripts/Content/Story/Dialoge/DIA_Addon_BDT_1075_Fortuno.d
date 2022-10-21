///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_EXIT   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 999;
	condition   = DIA_Addon_Fortuno_EXIT_Condition;
	information = DIA_Addon_Fortuno_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Fortuno_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Fortuno_PICKPOCKET (C_INFO)
{
	npc			= BDT_1075_Addon_Fortuno;
	nr			= 900;
	condition	= DIA_Addon_Fortuno_PICKPOCKET_Condition;
	information	= DIA_Addon_Fortuno_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Fortuno_PICKPOCKET_Condition()
{
	C_Beklauen (10, 25);
};
 
FUNC VOID DIA_Addon_Fortuno_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Fortuno_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Fortuno_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Fortuno_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Fortuno_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Fortuno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fortuno_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Fortuno_PICKPOCKET);
};
	
func void DIA_Addon_Fortuno_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hi
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Hi   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 2;
	condition   = DIA_Addon_Fortuno_Hi_Condition;
	information = DIA_Addon_Fortuno_Hi_Info;
	permanent   = TRUE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Fortuno_Hi_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Fortuno_Geheilt_01 == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Hi_Info()
{
	if (Fortuno_Einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_00");//(nerv�zn�) Temn� mrak kolem domu... u� se bl��...
		AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_01");//Krev... jen ta ho vyvol�... ON m� vid�... on m� vid�... ach ne, b� pry�, ztra� se...
		AI_Output (other, self, "DIA_Addon_Fortuno_Hi_15_02");//Jsi v po��dku?
		Fortuno_Einmal = TRUE;
		
		Log_CreateTopic (Topic_Addon_Fortuno,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Fortuno,LOG_RUNNING);
		
		B_LogEntry (Topic_Addon_Fortuno,"Fortuno se �pln� pom�tl. Hled� n�jak�ho 'zelen�ho novice'.");
		
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_03");//Zelen�... zelen� novic... nem��u ho naj�t.
	
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Je�t� se vr�t�m. (KONEC)",DIA_Addon_Fortuno_Hi_BACK);	
	
	Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"M��u ti n�jak pomoci?",DIA_Addon_Fortuno_Hi_HILFE);
	
	if Npc_HasItems (other, ItMi_Joint ) >= 1
	{
		Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Tum� trochu tr�vy z ba�in.",DIA_Addon_Fortuno_Hi_JOINT);
	};
	if Npc_HasItems (other, ItMi_Addon_Joint_01 ) >= 1
	{ 
		Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Tum�, vezmi si tohohle 'zelen�ho novice'.",DIA_Addon_Fortuno_Hi_GREEN);
	};
};
FUNC VOID DIA_Addon_Fortuno_Hi_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Addon_Fortuno_Hi_HILFE()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_HILFE_15_00");//M��u ti n�jak pomoci?
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_HILFE_13_01");//Zelen�... zelen� novic pom��e novici...
};
FUNC VOID DIA_Addon_Fortuno_Hi_JOINT()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_JOINT_15_00");//Tum�, dej si tuhle tr�vu z ba�in.
	
	if B_GiveInvItems (other, self,ItMi_Joint,1)
	{
		AI_UseItem (self, ItMI_Joint);
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_JOINT_13_01");//Nen� zelen�, nen� siln�, nen� zelen�, nen� siln�...
};
FUNC VOID DIA_Addon_Fortuno_Hi_GREEN()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_GREEN_15_00");//Tum�, dej si tady tohohle 'zelen�ho novice'.
	
	if B_GiveInvItems (other, self,ItMi_Addon_Joint_01,1)
	{
		AI_UseItem (self, ItMI_Addon_Joint_01);
		
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_GREEN_13_01");//(prob�r� se) A������!
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_GREEN_13_02");//Moje hlava... kdo... jsem... jsem Fortuno... co... co je?
	
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	Fortuno_Geheilt_01 = TRUE;
	
	B_GivePlayerXP (XP_Addon_Fortuno_01);
	
	B_LogEntry (Topic_Addon_Fortuno,"'Zelen� novic' pomohl Fortunovi vy�istit hlavu.");
};


///////////////////////////////////////////////////////////////////////
//	Info wer
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_wer   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 2;
	condition   = DIA_Addon_Fortuno_wer_Condition;
	information = DIA_Addon_Fortuno_wer_Info;
	permanent   = FALSE;
	description	= "Tak mi �ekni, co ti je.";
};
FUNC INT DIA_Addon_Fortuno_wer_Condition()
{	
	if (Fortuno_Geheilt_01 == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_wer_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_00");//No tak mi pov�z, co je s tebou.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_01");//Kdysi jsem pat�il k bratrstvu Sp��e. V�ecko bylo tehd� fajn.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_02");//Ano, byli jsme b�val� zlo�inci, ale jako novici jsme nem�li ��dn� starosti.
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_03");//Hele, j� byl v Hornick�m �dol� zav�enej taky, tak�e mi rad�i pov�z n�co nov�ho.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_04");//J�... j� si nic nepamatuju. Temnota mi zast�ela mysl...
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_05");//No tak, soust�e� se, co se stalo? Kdy ses probral?
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_06");//Havran... pamatuju si jenom Havrana a... a n�jak� temn� m�stnosti.
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_07");//Co je s Havranem? Co ti ud�lal?
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_08");//(povzdech) Je mi l�to. Moje mysl jako by po��d byla je�t� ve v�zen�... s�m to nech�pu...
};
///////////////////////////////////////////////////////////////////////
//	Info FREE
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_FREE   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 5;
	condition   = DIA_Addon_Fortuno_FREE_Condition;
	information = DIA_Addon_Fortuno_FREE_Info;
	permanent   = FALSE;
	description	= "N�jak si tu pam� p�ece mus� osv�it.";
};
FUNC INT DIA_Addon_Fortuno_FREE_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_wer)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_FREE_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_00");//Mus� b�t p�ece n�jak� zp�sob, jak ti osv�it pam�.
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_01");//Jo... jo, mo�n� to n�jak p�jde.
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_02");//Guru znali r�zn� zp�soby, jak pozm�nit ducha a v�li.
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_03");//A PAMATUJE� si z toho n�co?
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_04");//Ne, ob�v�m se, �e tyhle v�domosti zmizely spolu s guru.
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_05");//A sakra. No, jestli existuje n�jak� zp�sob, jak osvobodit ducha, tak ho najdu.

	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");
	
	B_LogEntry (Topic_Addon_Fortuno,"Fortuno u� je sice p�i smyslech, ale zase si nic nepamatuje.");
};
///////////////////////////////////////////////////////////////////////
//	Info Herb
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Herb   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 99;
	condition   = DIA_Addon_Fortuno_Herb_Condition;
	information = DIA_Addon_Fortuno_Herb_Info;
	permanent   = FALSE;
	description	= "Pot�ebuje� je�t� dal�� tr�vu z ba�in?";
};
FUNC INT DIA_Addon_Fortuno_Herb_Condition()
{
	if (Fortuno_Geheilt_01 == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Herb_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Herb_15_00");//Nepot�ebuje� je�t� n�jakou tr�vu z ba�in?
	AI_Output (self, other, "DIA_Addon_Fortuno_Herb_13_01");//Joooo, ur�it�. Koup�m v�ecku tr�vu, kter� se ti dostane do rukou.
	AI_Output (self, other, "DIA_Addon_Fortuno_Herb_13_02");//A zaplat�m ti za ni v�c ne� Fisk.
};
FUNC VOID B_Fortuno_InfoManager()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Trade);
	Info_AddChoice (DIA_Addon_Fortuno_Trade,DIALOG_BACK,DIA_Addon_Fortuno_Trade_BACK);
	if (Npc_HasItems (other, ITPl_SwampHerb) >= 1)
	{
		Info_AddChoice (DIA_Addon_Fortuno_Trade,"(d�t mu v�ecku tr�vu z ba�in)",DIA_Addon_Fortuno_Trade_all);
		Info_AddChoice (DIA_Addon_Fortuno_Trade,"(d�t mu 1 ubalenou tr�vu z ba�in)",DIA_Addon_Fortuno_Trade_1);
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Trade (kein Trade Modul!)
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Trade   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 100;
	condition   = DIA_Addon_Fortuno_Trade_Condition;
	information = DIA_Addon_Fortuno_Trade_Info;
	permanent   = TRUE;
	description	= "M�m tu pro tebe tr�vu z ba�in.";
};
FUNC INT DIA_Addon_Fortuno_Trade_Condition()
{	
	if (Npc_HasItems (other, ITPl_SwampHerb) >= 1)
	&& Npc_KnowsInfo (other, DIA_Addon_Fortuno_Herb)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Trade_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Trade_15_00");//M�m pro tebe n�jakou tr�vu z ba�in.
	B_Fortuno_InfoManager();
};
FUNC VOID DIA_Addon_Fortuno_Trade_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Trade);
};
FUNC VOID DIA_Addon_Fortuno_Trade_all()
{
	var int amount;
	amount = Npc_HasItems (other, Itpl_Swampherb);
	
	if B_GiveInvItems (other, self, ITPL_Swampherb, amount)
	{
		Npc_RemoveInvItems (self, ITPL_Swampherb, Npc_HasItems (self, ITPL_Swampherb));
	};
	
	B_GiveInvItems (self, other, ItMi_Gold, amount * Value_SwampHerb);
	
	B_GivePlayerXP (amount * 10);
	B_Fortuno_InfoManager();
};
FUNC VOID DIA_Addon_Fortuno_Trade_1()
{
	if B_GiveInvItems (other, self, ITPL_Swampherb, 1)
	{
		Npc_RemoveInvItems (self, ITPL_Swampherb, Npc_HasItems (self, ITPL_Swampherb));
	};
	
	B_GiveInvItems (self, other, ItMi_Gold, Value_SwampHerb);
	
	B_GivePlayerXP (10);
	B_Fortuno_InfoManager();
};

///////////////////////////////////////////////////////////////////////
//	Info Trank
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Trank   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 3;
	condition   = DIA_Addon_Fortuno_Trank_Condition;
	information = DIA_Addon_Fortuno_Trank_Info;
	permanent   = FALSE;
	description	= "M�m tu pro tebe lektvar.";
};
FUNC INT DIA_Addon_Fortuno_Trank_Condition()
{
	if (Fortuno_Geheilt_01 == TRUE)
	&&   Npc_KnowsInfo(other,DIA_Addon_Fortuno_FREE)
	&& ((Npc_HasItems (other, ItPo_Addon_Geist_01) >= 1)
	||  (Npc_HasItems (other, ItPo_Addon_Geist_02) >= 1))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Trank_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Trank_15_00");//M�m pro tebe jist� lektvar. Pom��e ti o�ivit vzpom�nky.
	AI_Output (self, other, "DIA_Addon_Fortuno_Trank_13_01");//V���m ti.
	
	if (Npc_HasItems (other, ItPo_Addon_Geist_02) >= 1)//der richtige
	{
		if B_GiveInvItems (other, self, ItPo_Addon_Geist_02,1)
		{
			AI_UseItem (self, ItPo_Addon_Geist_02);
		};
		B_GivePlayerXP (XP_Addon_Fortuno_02);
		
	}
	else
	{
		if B_GiveInvItems (other, self, ItPo_Addon_Geist_01,1)//der...�h...t�dliche
		{
			Log_SetTopicStatus (Topic_Addon_Fortuno,LOG_OBSOLETE);
			AI_StopProcessInfos (self);
			AI_UseItem (self, ItPo_Addon_Geist_01);
		};
	};
};
///////////////////////////////////////////////////////////////////////
//	Info No more Secrets
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_more   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 2;
	condition   = DIA_Addon_Fortuno_more_Condition;
	information = DIA_Addon_Fortuno_more_Info;
	permanent   = FALSE;
	description	= "A d�l?";
};
FUNC INT DIA_Addon_Fortuno_more_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_Trank)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_more_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_00");//No a?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_01");//A��! U� si vzpom�n�m! Te� u� to vid�m � Adane, st�j p�i mn� � co jsem to ud�lal?!
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_02");//Tak co jsi ud�lal? A hlavn� co ud�lal Havran?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_03");//Pomoh jsem mu. Pomoh jsem mu nav�zat kontakt. S N�M. Cht�l n�jak� elix�ry a j� je pro n�j nam�chal.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_04");//Pokusil se otev��t port�l a dostat se do chr�mu.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_05");//Pro�? Co v tom chr�mu cht�l?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_06");//Mocn� artefakt. Je poh�ben� i s t�m, kdo ho kdysi nosil. S mocn�m v�le�n�kem, co se p�idal k N�MU.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_07");//A pak?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_08");//Nemohli jsme otev��t port�l.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_09");//Jen�e Havran v�d�l JIST�, �e to p�jde, kdy� vykope kn�zovu hrobku.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_10");//A proto sem taky p�ivedl v�echny ty otroky. Ob�ti, kter� mohl p�im�t, aby kopaly tam, kde i s�m �as odpo��v� v pokoji.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_11");//Kn�zovu hrobku?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_12");//M�sto posledn�ho odpo�inku Adanova kn�ze. Le�� v dole.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_13");//Taky si vzpom�n�m na kamenn� tabulky. V��il, �e mu uk�ou cestu.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_14");//A kdy� je kone�n� rozlu�til, u� m� nepot�eboval.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_15");//Seslal na m� kouzlo zapomn�n� a... a pak jsi m� vysvobodil a� ty.
	
	SC_KnowsFortunoInfos = TRUE;
	
	B_LogEntry (TOPIC_Addon_RavenKDW,"Havran chce z Adanova chr�mu z�skat n�jak� mocn� artefakt."); 
	Log_AddEntry (TOPIC_Addon_RavenKDW,"Havran v dole z jak�hosi d�vodu vykopal hrob n�jak�ho d�vn�ho kn�ze."); 
	Log_AddEntry (TOPIC_Addon_RavenKDW,"Havran v���, �e mu v jeho sna�en� pomohou n�jak� kamenn� tabulky."); 
	
	Npc_ExchangeRoutine (self, "START");
	B_GivePlayerXP (XP_Addon_Fortuno_03);
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fortuno_Attentat   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 9;
	condition   = DIA_Addon_Fortuno_Attentat_Condition;
	information = DIA_Addon_Fortuno_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Fortuno_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	&&  Npc_KnowsInfo (other,DIA_Addon_Fortuno_Trank)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Fortuno_Attentat_13_00");//�tok? Promi�, byl jsem na chv�li... tak n�jak mimo. Nev�m o tom v�bec nic.
};

