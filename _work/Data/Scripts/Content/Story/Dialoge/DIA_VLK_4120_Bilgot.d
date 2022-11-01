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
	AI_Output (self, other, "DIA_Bilgot_HALLO_05_00"); //Ey, ¿de dónde sales? ¿Vienes del castillo?

	Info_AddChoice	(DIA_Bilgot_HALLO, "Sí, vengo del castillo, ¿por qué?", DIA_Bilgot_HALLO_Burg );
	Info_AddChoice	(DIA_Bilgot_HALLO, "Pasaba por aquí de casualidad...", DIA_Bilgot_HALLO_Zufall );
};
func void DIA_Bilgot_HALLO_Zufall ()
{
	AI_Output (other, self, "DIA_Bilgot_HALLO_Zufall_15_00"); //Pasaba por aquí por casualidad...
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_01"); //Chico, nadie pasa por aquí POR CASUALIDAD. Estamos bastante fastidiados, ¡rodeados de chasqueadores!
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_02"); //Hasta ahora no ha pasado ningún día en el que no haya caído uno de los nuestros.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_03"); //¿No me vas a decir de dónde vienes? Muy bien, ¡que los chasqueadores te lleven!
	
	AI_StopProcessInfos (self);
};

func void DIA_Bilgot_HALLO_Burg ()
{
	AI_Output (other, self, "DIA_Bilgot_HALLO_Burg_15_00"); //Sí, vengo del castillo, ¿por qué?
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_01"); //¿Cuál es la situación allí?
	AI_Output (other, self, "DIA_Bilgot_HALLO_Burg_15_02"); //No es mejor que aquí. Los orcos siguen allí, si te refieres a eso.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_03"); //Maldición. Ya no se puede estar seguro en ninguna parte.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_04"); //Te diré una cosa: si no estuviera aterrorizado, me piraría de aquí.
	
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
	description	 = 	"De todas formas, ¿qué haces aquí?";
};
func int DIA_Bilgot_Job_Condition ()
{
	return TRUE;
};
func void DIA_Bilgot_Job_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_Job_15_00"); //De todas formas, ¿qué haces aquí?
	AI_Output (self, other, "DIA_Bilgot_Job_05_01"); //Soy el chico para todo de aquí. Cargo cosas, estoy atento a los chasqueadores, Bilgot esto, Bilgot lo otro...
	AI_Output (self, other, "DIA_Bilgot_Job_05_02"); //Debería haberme quedado en casa con la parienta. No era muy distinto a esto, pero al menos allí había algo decente para comer.
	AI_Output (self, other, "DIA_Bilgot_Job_05_03"); //Y ahora yo soy todo lo que queda de los hombres de armas asignados a Fajeth.
	AI_Output (self, other, "DIA_Bilgot_Job_05_04"); //¿Cómo iba a saber que esta expedición no regresaría?
	AI_Output (self, other, "DIA_Bilgot_Job_05_05"); //Mi compañero Olav desapareció. Quizá ÉL lo consiguió...
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
	description	 = 	"¿Qué sabes de los chasqueadores?";
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
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_00"); //¿Qué sabes de los chasqueadores?
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_01"); //¿Por qué quieres saber eso? ¡Y no me digas que no es más que simple curiosidad!
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_02"); //Voy a cazar chasqueadores de esos.
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_03"); //Qué locura. Yo los he visto: son unas bestias sanguinarias.
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_04"); //Entonces dime todo lo que sepas sobre ellos.
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_05"); //Mm... Podría ayudarte, ¡pero solo con una condición!
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_06"); //¿Qué es lo que quieres?
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_07"); //Si consigues matar a los chasqueadores, ¡me tienes que sacar de aquí!
	
	if ((Npc_IsDead (Fed)) == FALSE)
	{
		AI_Output (self, other, "DIA_Bilgot_Hilfe_05_08"); //No podré aguantar aquí mucho más. ¿Has hablado con Fed? El tío está chalado, ¡y yo no quiero terminar como él!
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
	description	 = 	"Dime lo que sabes y luego ¡te sacaré de aquí!";
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
	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_00"); //Dime lo que sabes y luego ¡te sacaré de aquí!
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_01"); //Sabía que podía contar contigo. Así que presta atención. He observado a los chasqueadores durante bastante tiempo.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_02"); //Son muy astutos y tienen cierta forma de... comunicación. Nunca van solos y siempre atacan en grupo.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_03"); //Pero hay algo más. Hay un lagarto entre ellos que es diferente. No se le suele ver, pero yo he podido verlo.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_04"); //Las otras bestias se inclinan cuando pasan a su lado, pero nunca lo pierden de vista al hacerlo.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_05"); //Si ése no se mueve, ningún lagarto próximo lo hará.
	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_06"); //¿Dónde puedo encontrar a esa maldita bestia?
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_07"); //Lo he visto junto a los escalones de la vieja torre de vigilancia.

	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_08"); //Bien. Creo que lo entiendo. ¡Gracias!
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_09"); //Recuerda, ¡me diste tu palabra!

	Wld_InsertNpc (NewMine_LeadSnapper,"OW_ORC_LOOKOUT_2_01"); //Der Rudelführer
	
	B_LogEntry (TOPIC_FajethKillSnapper,"Bilgot me ha hablado de un líder de la manáda de chasqueadores. Se supone que está en la escalera de la vieja atalaya."); 
	
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
	AI_Output (other, self, "DIA_Bilgot_TAKEYOUWITHME_15_00"); //¡Es la hora, Bilgot! Recoge tus cosas: nos vamos.
	//Joly: SC bringt den Typ bis zum Pass AI_Output (self, other, "DIA_Bilgot_TAKEYOUWITHME_05_01"); //Großartig! Es reicht mir schon, wenn du mich über die große Brücke am Fluss vor der belagerten Burg bringst. Den Rest schaff ich dann schon.
	//Joly: SC bringt den Typ bis zum Pass AI_Output (other, self, "DIA_Bilgot_TAKEYOUWITHME_15_02"); //Dann beeil dich!
	AI_Output (self, other, "DIA_Bilgot_TAKEYOUWITHME_05_03"); //¡Estoy listo!

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
	description	 = 	"¡¿No puedes caminar un poco más rápido?!";
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
	AI_Output (other, self, "DIA_Bilgot_LAUFSCHNELLER_15_00"); //¡¿No puedes caminar un poco más rápido?!
	AI_Output (self, other, "DIA_Bilgot_LAUFSCHNELLER_05_01"); //Voy todo lo rápido que puedo.
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
	AI_Output (other, self, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_00"); //Vale, ya estamos. Ahora, a largarse de aquí. ¡Esta zona está al rojo!
	AI_Output (self, other, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_01"); //¡Gracias!
	AI_Output (other, self, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_02"); //Que no te coman. Sería una pena.
	AI_Output (self, other, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_03"); //¡Hasta la próxima!
	
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
	description	 = 	"¿Qué haces aquí? Pensaba que te ibas a cruzar el paso...";
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
	AI_Output (other, self, "DIA_Bilgot_LetztePause_15_00"); //¿Qué haces aquí? Pensaba que ibas a cruzar el paso...
	AI_Output (self, other, "DIA_Bilgot_LetztePause_05_01"); //No puedo continuar. Déjame descansar un momento. Me recuperaré. ¡No te preocupes!
	AI_Output (other, self, "DIA_Bilgot_LetztePause_15_02"); //Si tú lo dices.
	AI_Output (self, other, "DIA_Bilgot_LetztePause_05_03"); //Solo un pequeño descanso.
	
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
	description	 = 	"Encontré a Olav.";
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
	AI_Output (other, self, "DIA_Bilgot_Olav_15_00"); //Encontré a Olav.
	AI_Output (self, other, "DIA_Bilgot_Olav_05_01"); //¿Y qué anda haciendo?
	AI_Output (other, self, "DIA_Bilgot_Olav_15_02"); //Está muerto. Los lobos se lo comieron.
	AI_Output (self, other, "DIA_Bilgot_Olav_05_03"); //Maldición. Espero que, al menos, yo pueda salir de aquí.
	
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



