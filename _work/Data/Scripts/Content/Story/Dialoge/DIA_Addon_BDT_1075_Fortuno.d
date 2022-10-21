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
		AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_00");//(angustiado) Una nube negra sobre la casa� el elegido se aproxima
		AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_01");//Con sangre�necesaria para llamarlo� �L me observa� �l me observa� oh, no, vete, m�rchate.
		AI_Output (other, self, "DIA_Addon_Fortuno_Hi_15_02");//�Est�s bien?
		Fortuno_Einmal = TRUE;
		
		Log_CreateTopic (Topic_Addon_Fortuno,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Fortuno,LOG_RUNNING);
		
		B_LogEntry (Topic_Addon_Fortuno,"Fortuno ha perdido la cabeza. Anda buscando un 'novicio verde'.");
		
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_03");//Novicio� novicio verde� no puedo encontrarlo
	
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Volver� luego ... (FIN)",DIA_Addon_Fortuno_Hi_BACK);	
	
	Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"�En qu� puedo ayudarte?",DIA_Addon_Fortuno_Hi_HILFE);
	
	if Npc_HasItems (other, ItMi_Joint ) >= 1
	{
		Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Toma, hierba del pantano.",DIA_Addon_Fortuno_Hi_JOINT);
	};
	if Npc_HasItems (other, ItMi_Addon_Joint_01 ) >= 1
	{ 
		Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Toma, un 'novicio verde'.",DIA_Addon_Fortuno_Hi_GREEN);
	};
};
FUNC VOID DIA_Addon_Fortuno_Hi_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Addon_Fortuno_Hi_HILFE()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_HILFE_15_00");//�En qu� puedo ayudarte?
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_HILFE_13_01");//El novicio� el novicio verde ayudar� al novicio
};
FUNC VOID DIA_Addon_Fortuno_Hi_JOINT()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_JOINT_15_00");//Toma, hierba del pantano.
	
	if B_GiveInvItems (other, self,ItMi_Joint,1)
	{
		AI_UseItem (self, ItMI_Joint);
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_JOINT_13_01");//No es verde, no es fuerte, no es verde, no es fuerte
};
FUNC VOID DIA_Addon_Fortuno_Hi_GREEN()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_GREEN_15_00");//Toma, un 'novicio verde'.
	
	if B_GiveInvItems (other, self,ItMi_Addon_Joint_01,1)
	{
		AI_UseItem (self, ItMI_Addon_Joint_01);
		
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_GREEN_13_01");//(recuper�ndose) AAAHHH...
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_GREEN_13_02");//Mi cabeza� qui�n� soy� Fortuno� �qu� qu� ha pasado?
	
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	Fortuno_Geheilt_01 = TRUE;
	
	B_GivePlayerXP (XP_Addon_Fortuno_01);
	
	B_LogEntry (Topic_Addon_Fortuno,"El 'novicio verde' ha ayudado a Fortuno a aclarar sus ideas.");
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
	description	= "Vale, ahora dime cu�l es tu problema.";
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
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_00");//Dime lo que te ocurre.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_01");//Yo pertenec�a a la Hermandad del Durmiente. Todo era perfecto en aqu�l entonces.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_02");//Pues bien, todos �ramos criminales condenados, pero nosotros, los novicios, no ten�amos preocupaciones.
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_03");//Eh, yo era prisionero del Valle de las Minas. Cu�ntame algo que no sepa.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_04");//No� no recuerdo nada. La Oscuridad nubla mi mente
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_05");//Vamos, conc�ntrate. �Qu� ocurri�? �Cu�ndo recuperaste la consciencia?
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_06");//Raven� S�lo recuerdo a Raven y� y salas oscuras.
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_07");//H�blame de Raven. �Qu� te hizo?
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_08");//(suspira) Lo siento. Es como si mi mente hubiera sido apresada� No lo entiendo ni yo
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
	description	= "Debe de haber un modo de refrescarte la memoria.";
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
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_00");//Debe de haber un modo de refrescarte la memoria.
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_01");//S� s�, quiz� haya alg�n modo.
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_02");//Los gur�s conoc�an varias formas de alterar el esp�ritu y la voluntad.
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_03");//�RECUERDAS algo sobre eso?
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_04");//No, me temo que esos conocimientos se desvanecieron con los gur�s
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_05");//Maldita sea, si hay un modo de liberar tu esp�ritu, lo averiguar�.

	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");
	
	B_LogEntry (Topic_Addon_Fortuno,"Fortuno ha recuperado el juicio, pero a�n no recuerda nada.");
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
	description	= "�Necesitas m�s hierba del pantano?";
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
	AI_Output (other, self, "DIA_Addon_Fortuno_Herb_15_00");//�Necesitas m�s hierba del pantano?
	AI_Output (self, other, "DIA_Addon_Fortuno_Herb_13_01");//S�, claro que s�. Te comprar� toda la hierba del pantano que puedas conseguir.
	AI_Output (self, other, "DIA_Addon_Fortuno_Herb_13_02");//Te pagar� incluso m�s que Fisk.
};
FUNC VOID B_Fortuno_InfoManager()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Trade);
	Info_AddChoice (DIA_Addon_Fortuno_Trade,DIALOG_BACK,DIA_Addon_Fortuno_Trade_BACK);
	if (Npc_HasItems (other, ITPl_SwampHerb) >= 1)
	{
		Info_AddChoice (DIA_Addon_Fortuno_Trade,"(entrega toda la hierba del pantano)",DIA_Addon_Fortuno_Trade_all);
		Info_AddChoice (DIA_Addon_Fortuno_Trade,"(entrega 1 hierba del pantano)",DIA_Addon_Fortuno_Trade_1);
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
	description	= "Tengo hierba del pantano para ti�";
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
	AI_Output (other, self, "DIA_Addon_Fortuno_Trade_15_00");//Te traigo hierba del pantano
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
	description	= "Tengo una poci�n para ti�";
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
	AI_Output (other, self, "DIA_Addon_Fortuno_Trank_15_00");//Tengo una poci�n para ti. Te ayudar� a recordar.
	AI_Output (self, other, "DIA_Addon_Fortuno_Trank_13_01");//Conf�o en ti.
	
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
	description	= "�Y�?";
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
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_00");//�Y�?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_01");//�Aah! �A�ahora recuerdo! Veamos� Adanos, as�steme. �Qu� he hecho?
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_02");//S�, �qu� has hecho? Y sobre todo: �qu� ha hecho Raven?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_03");//Le ayud� a contactar. Con �L. Quer�a varios elixires� Yo se los prepar�.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_04");//Intent� abrir el portal para entrar en el templo.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_05");//�Por qu�? �Qu� se le ha perdido en el templo?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_06");//Un poderoso artefacto� Est� enterrado junto con quien lo llev� en su d�a. Un valeroso guerrero que cay� ante �L.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_07");//�Y luego?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_08");//No pudimos abrir el portal.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_09");//Pero Raven estaba CONVENCIDO de que podr�a si exhumaba la tumba del sacerdote.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_10");//Por eso trajo aqu� a los esclavos. V�ctimas a las que pod�a obligar a cavar donde los poderes del tiempo reposaban.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_11");//�Tumba del sacerdote?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_12");//El lugar de descanso de un sacerdote de Adanos. Est� en la mina.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_13");//Tambi�n recuerdo las tablillas de piedra. Cre�a que le mostrar�an el camino.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_14");//Y cuando pudiera descifrar los caracteres que ven�an escritos, ya no me necesitar�a.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_15");//Me ech� un conjuro de olvido y� y t� me has liberado.
	
	SC_KnowsFortunoInfos = TRUE;
	
	B_LogEntry (TOPIC_Addon_RavenKDW,"Raven quiere recuperar un poderoso artefacto del templo de Adanos."); 
	Log_AddEntry (TOPIC_Addon_RavenKDW,"Por alguna raz�n, Raven ha hecho exhumar la tumba de un sacerdote de la antigua cultura en la mina."); 
	Log_AddEntry (TOPIC_Addon_RavenKDW,"Raven cree que algunas tablillas de piedra le ayudar�n con sus planes."); 
	
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
	AI_Output (self, other, "DIA_Addon_Fortuno_Attentat_13_00");//�Ataque? Lo siento, estuve� ausente�un tiempo. No s� nada sobre eso.
};

