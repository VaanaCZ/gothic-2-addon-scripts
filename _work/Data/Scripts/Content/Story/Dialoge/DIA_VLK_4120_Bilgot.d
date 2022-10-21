///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Bilgot_EXIT   (C_INFO)
{
	npc         = VLK_4120_Bilgot;
	nr          = 999;
	condition   = DIA_Bilgot_EXIT_Condition;
	information = DIA_Bilgot_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bilgot_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bilgot_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_HALLO		(C_INFO)
{
	npc		 	 = 	VLK_4120_Bilgot;
	nr			 =  2;
	condition	 = 	DIA_Bilgot_HALLO_Condition;
	information	 = 	DIA_Bilgot_HALLO_Info;
	important	 = 	TRUE;
	permanent 	 =  FALSE;
};
func int DIA_Bilgot_HALLO_Condition ()
{
	return TRUE;
};
func void DIA_Bilgot_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Bilgot_HALLO_05_00"); //Ey, �de d�nde sales? �Vienes del castillo?

	Info_AddChoice	(DIA_Bilgot_HALLO, "S�, vengo del castillo, �por qu�?", DIA_Bilgot_HALLO_Burg );
	Info_AddChoice	(DIA_Bilgot_HALLO, "Pasaba por aqu� de casualidad...", DIA_Bilgot_HALLO_Zufall );
};
func void DIA_Bilgot_HALLO_Zufall ()
{
	AI_Output (other, self, "DIA_Bilgot_HALLO_Zufall_15_00"); //Pasaba por aqu� por casualidad...
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_01"); //Chico, nadie pasa por aqu� POR CASUALIDAD. Estamos bastante fastidiados, �rodeados de chasqueadores!
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_02"); //Hasta ahora no ha pasado ning�n d�a en el que no haya ca�do uno de los nuestros.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_03"); //�No me vas a decir de d�nde vienes? Muy bien, �que los chasqueadores te lleven!
	
	AI_StopProcessInfos (self);
};

func void DIA_Bilgot_HALLO_Burg ()
{
	AI_Output (other, self, "DIA_Bilgot_HALLO_Burg_15_00"); //S�, vengo del castillo, �por qu�?
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_01"); //�Cu�l es la situaci�n all�?
	AI_Output (other, self, "DIA_Bilgot_HALLO_Burg_15_02"); //No es mejor que aqu�. Los orcos siguen all�, si te refieres a eso.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_03"); //Maldici�n. Ya no se puede estar seguro en ninguna parte.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_04"); //Te dir� una cosa: si no estuviera aterrorizado, me pirar�a de aqu�.
	
	Info_ClearChoices	(DIA_Bilgot_HALLO);
};
///////////////////////////////////////////////////////////////////////
//	Info Job
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_Job		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  3;
	condition	 = 	DIA_Bilgot_Job_Condition;
	information	 = 	DIA_Bilgot_Job_Info;
	permanent 	 =  FALSE;
	description	 = 	"De todas formas, �qu� haces aqu�?";
};
func int DIA_Bilgot_Job_Condition ()
{
	return TRUE;
};
func void DIA_Bilgot_Job_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_Job_15_00"); //De todas formas, �qu� haces aqu�?
	AI_Output (self, other, "DIA_Bilgot_Job_05_01"); //Soy el chico para todo de aqu�. Cargo cosas, estoy atento a los chasqueadores, Bilgot esto, Bilgot lo otro...
	AI_Output (self, other, "DIA_Bilgot_Job_05_02"); //Deber�a haberme quedado en casa con la parienta. No era muy distinto a esto, pero al menos all� hab�a algo decente para comer.
	AI_Output (self, other, "DIA_Bilgot_Job_05_03"); //Y ahora yo soy todo lo que queda de los hombres de armas asignados a Fajeth.
	AI_Output (self, other, "DIA_Bilgot_Job_05_04"); //�C�mo iba a saber que esta expedici�n no regresar�a?
	AI_Output (self, other, "DIA_Bilgot_Job_05_05"); //Mi compa�ero Olav desapareci�. Quiz� �L lo consigui�...
};
///////////////////////////////////////////////////////////////////////
//	Info Hilfe
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_Hilfe		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr 			 =  3;
	condition	 = 	DIA_Bilgot_Hilfe_Condition;
	information	 = 	DIA_Bilgot_Hilfe_Info;
	permanent 	 =  FALSE;
	description	 = 	"�Qu� sabes de los chasqueadores?";
};
func int DIA_Bilgot_Hilfe_Condition ()
{
	if	(MIS_Fajeth_Kill_Snapper == LOG_RUNNING)	
	{
		return TRUE;
	};
};
func void DIA_Bilgot_Hilfe_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_00"); //�Qu� sabes de los chasqueadores?
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_01"); //�Por qu� quieres saber eso? �Y no me digas que no es m�s que simple curiosidad!
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_02"); //Voy a cazar chasqueadores de esos.
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_03"); //Qu� locura. Yo los he visto: son unas bestias sanguinarias.
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_04"); //Entonces dime todo lo que sepas sobre ellos.
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_05"); //Mm... Podr�a ayudarte, �pero solo con una condici�n!
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_06"); //�Qu� es lo que quieres?
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_07"); //Si consigues matar a los chasqueadores, �me tienes que sacar de aqu�!
	
	if ((Npc_IsDead (Fed)) == FALSE)
	{
		AI_Output (self, other, "DIA_Bilgot_Hilfe_05_08"); //No podr� aguantar aqu� mucho m�s. �Has hablado con Fed? El t�o est� chalado, �y yo no quiero terminar como �l!
	};
};

///////////////////////////////////////////////////////////////////////
//	Info KnowsLeadSnapper
///////////////////////////////////////////////////////////////////////

instance DIA_Bilgot_KNOWSLEADSNAPPER		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  4;
	condition	 = 	DIA_Bilgot_KNOWSLEADSNAPPER_Condition;
	information	 = 	DIA_Bilgot_KNOWSLEADSNAPPER_Info;
	permanent 	 =  FALSE;
	description	 = 	"Dime lo que sabes y luego �te sacar� de aqu�!";
};

func int DIA_Bilgot_KNOWSLEADSNAPPER_Condition ()
{
	if ((Npc_KnowsInfo(other, DIA_Bilgot_Hilfe))
	&& (MIS_Fajeth_Kill_Snapper == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_KNOWSLEADSNAPPER_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_00"); //Dime lo que sabes y luego �te sacar� de aqu�!
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_01"); //Sab�a que pod�a contar contigo. As� que presta atenci�n. He observado a los chasqueadores durante bastante tiempo.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_02"); //Son muy astutos y tienen cierta forma de... comunicaci�n. Nunca van solos y siempre atacan en grupo.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_03"); //Pero hay algo m�s. Hay un lagarto entre ellos que es diferente. No se le suele ver, pero yo he podido verlo.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_04"); //Las otras bestias se inclinan cuando pasan a su lado, pero nunca lo pierden de vista al hacerlo.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_05"); //Si �se no se mueve, ning�n lagarto pr�ximo lo har�.
	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_06"); //�D�nde puedo encontrar a esa maldita bestia?
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_07"); //Lo he visto junto a los escalones de la vieja torre de vigilancia.

	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_08"); //Bien. Creo que lo entiendo. �Gracias!
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_09"); //Recuerda, �me diste tu palabra!

	Wld_InsertNpc (NewMine_LeadSnapper,"OW_ORC_LOOKOUT_2_01"); //Der Rudelf�hrer
	
	B_LogEntry (TOPIC_FajethKillSnapper,"Bilgot me ha hablado de un l�der de la man�da de chasqueadores. Se supone que est� en la escalera de la vieja atalaya."); 
	
	Log_CreateTopic (TOPIC_BilgotEscort,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BilgotEscort,LOG_RUNNING);
	B_LogEntry (TOPIC_BilgotEscort,"Bilgot quiere que le saque del valle.");
		
};
///////////////////////////////////////////////////////////////////////
//	Info TakeYouWithMe
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_TAKEYOUWITHME		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr 			 =  2;
	condition	 = 	DIA_Bilgot_TAKEYOUWITHME_Condition;
	information	 = 	DIA_Bilgot_TAKEYOUWITHME_Info;
	permanent 	 =  FALSE;
	description	 = 	"(Mantener promesa)";
};
func int DIA_Bilgot_TAKEYOUWITHME_Condition ()
{
	if (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS)
 	&& Npc_KnowsInfo(other, DIA_Bilgot_KNOWSLEADSNAPPER)
 			{
				return TRUE;
 			};
};
func void DIA_Bilgot_TAKEYOUWITHME_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_TAKEYOUWITHME_15_00"); //�Es la hora, Bilgot! Recoge tus cosas: nos vamos.
	//Joly: SC bringt den Typ bis zum Pass AI_Output (self, other, "DIA_Bilgot_TAKEYOUWITHME_05_01"); //Gro�artig! Es reicht mir schon, wenn du mich �ber die gro�e Br�cke am Fluss vor der belagerten Burg bringst. Den Rest schaff ich dann schon.
	//Joly: SC bringt den Typ bis zum Pass AI_Output (other, self, "DIA_Bilgot_TAKEYOUWITHME_15_02"); //Dann beeil dich!
	AI_Output (self, other, "DIA_Bilgot_TAKEYOUWITHME_05_03"); //�Estoy listo!

	Npc_ExchangeRoutine	(self, "FOLLOWTOOCBRIDGE");
	Bilgot.flags	= 0;	
	MIS_RescueBilgot = LOG_RUNNING;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info LaufSchneller
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_LAUFSCHNELLER		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  5;
	condition	 = 	DIA_Bilgot_LAUFSCHNELLER_Condition;
	information	 = 	DIA_Bilgot_LAUFSCHNELLER_Info;
	permanent	 =  FALSE;
	description	 = 	"��No puedes caminar un poco m�s r�pido?!";
};

func int DIA_Bilgot_LAUFSCHNELLER_Condition ()
{
	if ((Npc_KnowsInfo(other, DIA_Bilgot_TAKEYOUWITHME))
	&& ((Npc_KnowsInfo(other, DIA_Bilgot_BEIBRUECKEANGEKOMMEN))==FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_LAUFSCHNELLER_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_LAUFSCHNELLER_15_00"); //��No puedes caminar un poco m�s r�pido?!
	AI_Output (self, other, "DIA_Bilgot_LAUFSCHNELLER_05_01"); //Voy todo lo r�pido que puedo.
};
///////////////////////////////////////////////////////////////////////
//	Info BeiBrueckeAngekommen
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_BEIBRUECKEANGEKOMMEN		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  2;
	condition	 = 	DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Condition;
	information	 = 	DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Info;
	important	 = 	TRUE;
	permanent	 =  FALSE;
};
func int DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Condition ()
{
	if (Npc_GetDistToWP(self,"START")<8000) 				
	{
		return TRUE;
	};
};

func void DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_00"); //Vale, ya estamos. Ahora, a largarse de aqu�. �Esta zona est� al rojo!
	AI_Output (self, other, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_01"); //�Gracias!
	AI_Output (other, self, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_02"); //Que no te coman. Ser�a una pena.
	AI_Output (self, other, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_03"); //�Hasta la pr�xima!
	
	AI_StopProcessInfos (self);	
	TschuessBilgot = TRUE;
	MIS_RescueBilgot = LOG_SUCCESS;
	B_GivePlayerXP (XP_BilgotEscort);
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self, "FLEEOUTOFOW");
};
///////////////////////////////////////////////////////////////////////
//	Info LetztePause
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_LetztePause		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 = 	3;
	condition	 = 	DIA_Bilgot_LetztePause_Condition;
	information	 = 	DIA_Bilgot_LetztePause_Info;
	permanent	 = 	TRUE;
	description	 = 	"�Qu� haces aqu�? Pensaba que te ibas a cruzar el paso...";
};

func int DIA_Bilgot_LetztePause_Condition ()
{
	if (Npc_GetDistToWP(self,"START")<1000) 				
	{
		return TRUE;
	};
};

func void DIA_Bilgot_LetztePause_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_LetztePause_15_00"); //�Qu� haces aqu�? Pensaba que ibas a cruzar el paso...
	AI_Output (self, other, "DIA_Bilgot_LetztePause_05_01"); //No puedo continuar. D�jame descansar un momento. Me recuperar�. �No te preocupes!
	AI_Output (other, self, "DIA_Bilgot_LetztePause_15_02"); //Si t� lo dices.
	AI_Output (self, other, "DIA_Bilgot_LetztePause_05_03"); //Solo un peque�o descanso.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Olav
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_Olav		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 = 	3;
	condition	 = 	DIA_Bilgot_Olav_Condition;
	information	 = 	DIA_Bilgot_Olav_Info;
	permanent	 = 	FALSE;
	description	 = 	"Encontr� a Olav.";
};

func int DIA_Bilgot_Olav_Condition ()
{
	if (Npc_HasItems (Olav, ITSE_Olav) == 0)	
	&& (Npc_KnowsInfo (other,DIA_Bilgot_Job))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_Olav_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_Olav_15_00"); //Encontr� a Olav.
	AI_Output (self, other, "DIA_Bilgot_Olav_05_01"); //�Y qu� anda haciendo?
	AI_Output (other, self, "DIA_Bilgot_Olav_15_02"); //Est� muerto. Los lobos se lo comieron.
	AI_Output (self, other, "DIA_Bilgot_Olav_05_03"); //Maldici�n. Espero que, al menos, yo pueda salir de aqu�.
	
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bilgot_PICKPOCKET (C_INFO)
{
	npc			= VLK_4120_Bilgot;
	nr			= 900;
	condition	= DIA_Bilgot_PICKPOCKET_Condition;
	information	= DIA_Bilgot_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Bilgot_PICKPOCKET_Condition()
{
	C_Beklauen (20, 30);
};
 
FUNC VOID DIA_Bilgot_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bilgot_PICKPOCKET);
	Info_AddChoice		(DIA_Bilgot_PICKPOCKET, DIALOG_BACK 		,DIA_Bilgot_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bilgot_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bilgot_PICKPOCKET_DoIt);
};

func void DIA_Bilgot_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bilgot_PICKPOCKET);
};
	
func void DIA_Bilgot_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bilgot_PICKPOCKET);
};



