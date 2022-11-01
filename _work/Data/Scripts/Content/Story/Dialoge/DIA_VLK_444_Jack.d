///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jack_EXIT   (C_INFO)
{
	npc         = VLK_444_Jack;
	nr          = 999;
	condition   = DIA_Jack_EXIT_Condition;
	information = DIA_Jack_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Jack_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jack_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jack_PICKPOCKET (C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 900;
	condition	= DIA_Jack_PICKPOCKET_Condition;
	information	= DIA_Jack_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Jack_PICKPOCKET_Condition()
{
	C_Beklauen (50, 100);
};
 
FUNC VOID DIA_Jack_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jack_PICKPOCKET);
	Info_AddChoice		(DIA_Jack_PICKPOCKET, DIALOG_BACK 		,DIA_Jack_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jack_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jack_PICKPOCKET_DoIt);
};

func void DIA_Jack_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jack_PICKPOCKET);
};
	
func void DIA_Jack_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jack_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_GREET		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	4;
	condition	 = 	DIA_Jack_GREET_Condition;
	information	 = 	DIA_Jack_GREET_Info;
	important 	 =  TRUE; 

};

func int DIA_Jack_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Jack_GREET_Info ()
{
	AI_Output			(self ,other, "DIA_Jack_GREET_14_00"); //Eh, marinero de agua dulce, parece que estás bloqueado aquí.
	AI_Output			(self ,other, "DIA_Jack_GREET_14_01"); //Estás un poco pálido alrededor de las agallas.
	AI_Output			(self ,other, "DIA_Jack_GREET_14_02"); //Da igual, amigo. Lo único que necesitas es una buena brisa marina helada.
};


///////////////////////////////////////////////////////////////////////
//	Was machst Du hier
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_Job		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	5;
	condition	 = 	DIA_Jack_Job_Condition;
	information	 = 	DIA_Jack_Job_Info;

	description	 = 	"¿Qué estás haciendo aquí?";
};

func int DIA_Jack_Job_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_GREET)
	{
		return TRUE;
	};
};
func void DIA_Jack_Job_Info ()
{
	AI_Output			(other, self, "DIA_Jack_Job_15_00"); //¿Qué estás haciendo aquí?
	//AI_Output			(self, other, "DIA_Jack_Job_14_01"); //Damals, als junger Mann, bin ich noch zur See gefahren und habe so manchen großen Sturm miterlebt.
	//AI_Output			(self, other, "DIA_Jack_Job_14_02"); //Vor vielen Jahren hab ich mich dann hier nieder gelassen und war lange Zeit Leuchtturmwärter von Khorinis.
	//AI_Output			(self, other, "DIA_Jack_Job_14_03"); //Keine aufregende Sache. Wirklich nicht. Aber dieser alte Turm kam dem, was man ein Zuhause nennt, am Nächsten.
	//AI_Output			(self, other, "DIA_Jack_Job_14_04"); //Bin schon ziemlich lange nicht mehr oben gewesen.
	//AI_Output			(other, self, "DIA_Jack_Job_15_05"); //Warum nicht?
	AI_Output			(self ,other, "DIA_Jack_Job_14_06"); //Desde que esos bribones se hicieron con mi faro, no me he atrevido a acercarme a menos de 5 metros de él. Menuda gentuza asquerosa.
	AI_Output			(self ,other, "DIA_Jack_Job_14_07"); //Son criminales del Valle de las Minas, ya sabes.
	AI_Output			(self ,other, "DIA_Jack_Job_14_08"); //Hubo una enorme explosión al otro lado de las montañas y se esparcieron por todo el territorio como moscas. Ahora se esconden por todas partes, incluso en mi faro.
	AI_Output			(self ,other, "DIA_Jack_Job_14_09"); //Creo que están buscando un barco que puedan asaltar.
	AI_Output			(self ,other, "DIA_Jack_Job_14_10"); //¡Ja! Déjalos. Así al menos saldrían de mi torre.
	
	Log_CreateTopic (TOPIC_KillLighthouseBandits, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillLighthouseBandits, LOG_RUNNING);
	B_LogEntry (TOPIC_KillLighthouseBandits,"El viejo lobo de mar, Jack, no puede volver a su faro mientras los bandidos estén allí."); 
	
	MIS_Jack_KillLighthouseBandits = LOG_RUNNING;
	
};

///////////////////////////////////////////////////////////////////////
//	Erzähl mir was über die Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_City		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	6;
	condition	 = 	DIA_Jack_City_Condition;
	information	 = 	DIA_Jack_City_Info;

	description	 = 	"¿Vienes a menudo a la ciudad?";
};

func int DIA_Jack_City_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_Job)
	{
		return TRUE;
	};
};
func void DIA_Jack_City_Info ()
{
	AI_Output			(other, self, "DIA_Jack_City_15_00"); //¿Vienes a menudo a la ciudad?
	AI_Output			(self ,other, "DIA_Jack_City_14_01"); //Siempre digo que el puerto es el reflejo de una ciudad.
	AI_Output			(self ,other, "DIA_Jack_City_14_02"); //Un puerto es una puerta al mundo. Es donde todo el mundo se encuentra y donde todo comienza.
	AI_Output			(self ,other, "DIA_Jack_City_14_03"); //Cuando el puerto se va al garete, el resto de la ciudad no tarda en seguirlo.
};

///////////////////////////////////////////////////////////////////////
//	Erzähl mir was über den Hafen
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_Harbor		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	70;
	condition	 = 	DIA_Jack_Harbor_Condition;
	information	 = 	DIA_Jack_Harbor_Info;
	permanent	 =  TRUE;

	description	 = 	"Háblame del puerto.";
};

func int DIA_Jack_Harbor_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_City)
		&&	((Npc_GetDistToWP(self,"LIGHTHOUSE")< 3000) == FALSE)
		&& 	(JackIsCaptain == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jack_Harbor_Info ()
{
	AI_Output			(other, self, "DIA_Jack_Harbor_15_00"); //Háblame del puerto.
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_01"); //El puerto de Khorinis ya no es lo que era.
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_02"); //Por aquí no hay nada más que chusma, los barcos ya no llegan y el comercio está muerto. Este puerto está a punto de hundirse.
	
	Info_ClearChoices (DIA_Jack_Harbor);
	Info_AddChoice (DIA_Jack_Harbor,DIALOG_BACK,DIA_Jack_Harbor_Back);
	Info_AddChoice (DIA_Jack_Harbor,"¿Por qué ya no vienen barcos?",DIA_Jack_Harbor_Ships);
	Info_AddChoice (DIA_Jack_Harbor,"¿Qué quieres decir con chusma?",DIA_Jack_Harbor_Rogue);
	Info_AddChoice (DIA_Jack_Harbor,"¿Y por qué no te vas?",DIA_Jack_Harbor_Leave);
};

FUNC VOID DIA_Jack_Harbor_Back ()
{
	Info_ClearChoices (DIA_Jack_Harbor);
};

FUNC VOID DIA_Jack_Harbor_Ships ()
{	
	AI_Output (other,self ,"DIA_Jack_Harbor_Ships_15_00"); //¿Por qué ya no vienen barcos?
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_01"); //Todos dicen que, en cuanto termine la guerra, todo volverá a ser como antes. Eso es un montón de basura.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_02"); //Te lo digo: un marinero puede ver cuándo una ciudad se está yendo a pique.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_03"); //Un marinero siente eso en su sangre. Y, te lo digo: olvídate de este puerto, su apogeo pasó.
};

FUNC VOID DIA_Jack_Harbor_Rogue ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Rogue_15_00"); //¿Qué quieres decir con chusma?
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_01"); //Míralos, esos vagos maleantes. La mayoría de ellos no sabe ni lo que es trabajar. Lo único que hacen es beber todo el día y gastar su última paga en el burdel.
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_02"); //Te lo digo: mantente alejado de ellos.
};

FUNC VOID DIA_Jack_Harbor_Leave ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Leave_15_00"); //¿Y por qué no te vas?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_01"); //Nadie admitiría ahora a un viejo lobo de mar como yo en su barco.
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_02"); //La mayoría de la gente piensa que el viejo Jack tiene gota en sus viejos huesos podridos.
	AI_Output (other,self ,"DIA_Jack_Harbor_Leave_15_03"); //¿Y? ¿Tienen razón?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_04"); //Tonterías. En cuanto tenga otra vez esos tablones bajo mis pies, me sentiré como un joven chiquilicuatro.
};

///////////////////////////////////////////////////////////////////////
//	Info BanditenWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BANDITENWEG		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	7;
	condition	 = 	DIA_Jack_BANDITENWEG_Condition;
	information	 = 	DIA_Jack_BANDITENWEG_Info;

	description	 = 	"Los bandidos que ocupaban tu faro ya no están.";
};

func int DIA_Jack_BANDITENWEG_Condition ()
{
	if (Npc_IsDead(LeuchtturmBandit_1021))
		&& (Npc_IsDead(LeuchtturmBandit_1022))
		&& (Npc_IsDead(LeuchtturmBandit_1023))
		&& (MIS_Jack_KillLighthouseBandits == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Jack_BANDITENWEG_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BANDITENWEG_15_00"); //Los bandidos que estaban ocupando tu faro se han ido.
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_01"); //¿Es eso verdad? Por fin puedo volver a mi trabajo.
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_02"); //Ven conmigo al faro. Tendrás una increíble vista del mar desde ahí arriba.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Lighthouse");
	MIS_Jack_KillLighthouseBandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_KillLighthouseBandits);
};

///////////////////////////////////////////////////////////////////////
//	Info LighthouseFree
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_LIGHTHOUSEFREE		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	8;
	condition	 = 	DIA_Jack_LIGHTHOUSEFREE_Condition;
	information	 = 	DIA_Jack_LIGHTHOUSEFREE_Info;
	permanent	 = 	TRUE;


	description	 = 	"Tienes un bonito faro.";
};

func int DIA_Jack_LIGHTHOUSEFREE_Condition ()
{
	if (MIS_Jack_KillLighthouseBandits == LOG_SUCCESS)
		&&	(Npc_GetDistToWP(self,"LIGHTHOUSE")<3000) 
		&& (MIS_SCKnowsWayToIrdorath == FALSE) 
		{
				return TRUE;
		};
};

func void DIA_Jack_LIGHTHOUSEFREE_Info ()
{
	AI_Output			(other, self, "DIA_Jack_LIGHTHOUSEFREE_15_00"); //Tienes un bonito faro.
	AI_Output			(self, other, "DIA_Jack_LIGHTHOUSEFREE_14_01"); //Gracias. Sube las escaleras hasta arriba y disfruta de la bonita vista, amigo mío. Siéntete como en tu casa.
};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Jack_KAP3_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP3_EXIT_Condition;
	information	= DIA_Jack_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Jack_KAP4_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP4_EXIT_Condition;
	information	= DIA_Jack_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Jack_KAP5_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP5_EXIT_Condition;
	information	= DIA_Jack_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	51;
	condition	 = 	DIA_Jack_BEMYCAPTAIN_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Querrías volver al mar?";
};

func int DIA_Jack_BEMYCAPTAIN_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		&& (MIS_Jack_KillLighthouseBandits == LOG_SUCCESS)
		&& (MIS_Jack_NewLighthouseOfficer == 0)
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_15_00"); //¿No te gustaría volver al mar?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_01"); //Daría mi brazo derecho por que me contratasen en una goleta grande solo una vez más.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_02"); //Pero para un viejo lobo de mar como yo, eso no es tan fácil, amigo. De todas formas, ¿quién se ocuparía entonces del faro?

	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Da igual. No era más que una idea.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Necesito tu experiencia como marinero.", DIA_Jack_BEMYCAPTAIN_seaman );

};

func void DIA_Jack_BEMYCAPTAIN_seaman ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_00"); //Necesito tu experiencia como marinero.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_01"); //He sentido un escalofrío. ¿Qué estás planeando, colega? No te estás preparando para abordar el galeón de guerra del Rey, ¿no?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_02"); //¿Quién sabe?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_03"); //(Se ríe) Eso sería impactante. En fin. Pero no puedo abandonar mi faro así como así. Mmm. ¿Qué hacemos con ese asunto?
	
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                        
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                      
	B_LogEntry (TOPIC_Captain,"Jack, el viejo marinero del puerto, sería un buen capitán. Pero antes tengo que encontrar a alguien que custodie su faro."); 
	
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Da igual. No era más que una idea.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "¿Y si te consigo a alguien...?", DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer );

};
func void DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00"); //¿Y si mientras te traigo a alguien que se ocupe de tu faro?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01"); //No es una mala idea, chico. Y conozco justo a la persona adecuada.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02"); //Harad el herrero tiene un aprendiz llamado Brian. He hablado con él un montón de veces.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03"); //Me gustaría confiarle mi faro. Creo que sería la persona adecuada para ello.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04"); //Ve a hablar con él. Quizá tengamos suerte y el chico nos ayude.
	
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	MIS_Jack_NewLighthouseOfficer = LOG_RUNNING;
};


func void DIA_Jack_BEMYCAPTAIN_no ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_no_15_00"); //Da igual. No era más que una idea.
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain2
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN2		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	52;
	condition	 = 	DIA_Jack_BEMYCAPTAIN2_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN2_Info;

	description	 = 	"Acerca de Brian...";
};

func int DIA_Jack_BEMYCAPTAIN2_Condition ()
{
	if 	((MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS)
		|| 	((MIS_Jack_NewLighthouseOfficer == LOG_RUNNING)	&& 	(Npc_IsDead(Brian))))
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN2_Info ()
{
	if (Npc_IsDead(Brian))
	{
			AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN2_15_00"); //Brian está muerto.
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_01"); //Oh. Vivimos tiempos difíciles. Y era un tipo tan simpático.
			MIS_Jack_NewLighthouseOfficer = LOG_OBSOLETE;
	}
	else
	{
			AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN2_15_02"); //Brian se ocupará de tu faro desde ahora.
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_03"); //Esperaba que dijeras eso.
			B_GivePlayerXP (XP_Jack_NewLighthouseOfficer);
 
		
			if (SCGotCaptain == FALSE)
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_04"); //¿Aún me necesitas?
			}
			else
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_05"); //Veamos si el chico sirve de algo.
			AI_StopProcessInfos (self);
			};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain3
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN3		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	53;
	condition	 = 	DIA_Jack_BEMYCAPTAIN3_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN3_Info;

	description	 = 	"Sé mi capitán.";
};

func int DIA_Jack_BEMYCAPTAIN3_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jack_BEMYCAPTAIN2))
		&& (SCGotCaptain == FALSE)
		&& (MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS)
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN3_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_00"); //Sé mi capitán.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_01"); //He surcado los siete mares, amigo, pero nunca antes había sido capitán de un barco.
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_02"); //No sé nada sobre navegación. Tendrás que encargarte tú de eso.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_03"); //Lo haré lo mejor que pueda.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_04"); //Entonces, enséñame tu barco y a tu tripulación. ¿Y sabes a dónde te diriges? Quiero decir, ¿tienes una carta de navegación?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_05"); //Espérame en el puerto. No te preocupes de lo demás.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_06"); //Si tú lo dices.
	AI_StopProcessInfos (self);
	SCGotCaptain = TRUE;
	JackIsCaptain = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine	(self,"WaitForShipCaptain");
	
	B_GivePlayerXP (XP_Captain_Success);        
};

///////////////////////////////////////////////////////////////////////
//	Info Losfahren
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_LOSFAHREN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	59;
	condition	 = 	DIA_Jack_LOSFAHREN_Condition;
	information	 = 	DIA_Jack_LOSFAHREN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Bien, viejo. Icemos las velas.";
};

func int DIA_Jack_LOSFAHREN_Condition ()
{
	if (JackIsCaptain == TRUE)
		&& (MIS_ReadyforChapter6 ==	FALSE)
		{
				return TRUE;
		};
};

func void DIA_Jack_LOSFAHREN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_LOSFAHREN_15_00"); //Bien, viejo. Icemos las velas.

	if ((B_CaptainConditions (self)) == TRUE)
	{
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_01"); //Todo está en orden. Muéstrame tu carta de navegación.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_02"); //Éste va a ser un bonito viaje. Espero que lleguemos allí de una pieza.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_03"); //¿Seguro que tienes todo lo que necesitas? No vamos a volver solo porque se te haya olvidado algo.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_04"); //Si estás seguro de que tienes todo lo que necesitas, ve al camarote del capitán y descansa. Lo vas a necesitar.
		AI_StopProcessInfos (self);
		B_CaptainCallsAllOnBoard (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_05"); //Ten mucho cuidado, colega. Todavía ni siquiera he visto la bañera. No funciona así.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_06"); //Primero necesitas una tripulación completa con, al menos, 5 hombres. Acceso libre al barco y una carta de navegación. Si no, olvídalo.
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info perm5_NotCaptain
///////////////////////////////////////////////////////////////////////

instance DIA_Jack_PERM5_NOTCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	59;
	condition	 = 	DIA_Jack_PERM5_NOTCAPTAIN_Condition;
	information	 = 	DIA_Jack_PERM5_NOTCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Y ahora qué va a pasar?";
};

func int DIA_Jack_PERM5_NOTCAPTAIN_Condition ()
{
		if	((Npc_KnowsInfo(other, DIA_Jack_BEMYCAPTAIN2))
		&& 	(SCGotCaptain == TRUE)
		&&	(JackIsCaptain == FALSE))
		|| 	(MIS_Jack_NewLighthouseOfficer == LOG_OBSOLETE)
		{
				return TRUE;
		};
};

func void DIA_Jack_PERM5_NOTCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_PERM5_NOTCAPTAIN_15_00"); //¿Y ahora qué va a pasar?
	AI_Output			(self, other, "DIA_Jack_PERM5_NOTCAPTAIN_14_01"); //He meditado el asunto. Creo que, después de todo, me voy a quedar aquí a cuidar de mi faro.
	
	AI_StopProcessInfos (self);
};

//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Jack_KAP6_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP6_EXIT_Condition;
	information	= DIA_Jack_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};










































 





















