FUNC VOID B_DaronSegen ()
{
	Daron_Segen = TRUE;

	var string concatText;
	
	var int Bonus_1;
	var int Bonus_2;
	var int Bonus_3;

	if (Daron_Spende < 100)
	{
		if other.attribute[ATR_HITPOINTS] <  other.attribute[ATR_HITPOINTS_MAX]
		{
			other.attribute [ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
			PrintScreen (PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);   
		};
	}	 	
	else if (Daron_Spende < 250)
	&&		(Bonus_1 == FALSE)
	{
		B_RaiseAttribute (other, ATR_MANA_MAX, 2);
		
		other.attribute[ATR_MANA] =  other.attribute[ATR_MANA_MAX];
				
		Bonus_1 = TRUE;
	}
	else if (Daron_Spende < 500)
	&&		(Bonus_2 == FALSE)
	{
		B_GivePlayerXP (XP_Ambient);
		Bonus_2 = TRUE;
	}
	else if (Daron_Spende >= 750) 	
	&&		(Daron_Spende < 1000) 	
	&& 		(Bonus_3 == FALSE)
	{
		other.lp = (other.lp + 1);
		
		concatText = ConcatStrings(PRINT_LearnLP, IntToString(1));
		PrintScreen	(concatText, -1, -1, FONT_SCREEN, 2);
		Bonus_3 = TRUE;
	}
	else 
	{
		other.attribute[ATR_HITPOINTS] =  other.attribute[ATR_HITPOINTS_MAX];
		other.attribute[ATR_MANA] =  other.attribute[ATR_MANA_MAX];

		other.attribute[ATR_HITPOINTS_MAX] = (other.attribute[ATR_HITPOINTS_MAX] + 5);
		
		concatText = ConcatStrings(PRINT_Learnhitpoints_MAX, IntToString(5));
		PrintScreen	(concatText, -1, -1, FONT_Screen, 2);
	};
};
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Daron_EXIT(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 999;
	condition	= DIA_Daron_EXIT_Condition;
	information	= DIA_Daron_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Daron_EXIT_Condition()
{
	
	return TRUE;
};
FUNC VOID DIA_Daron_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				  Hallo 
// ************************************************************
INSTANCE DIA_Daron_Hallo(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 2;
	condition	= DIA_Daron_Hallo_Condition;
	information	= DIA_Daron_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Daron_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Hallo_Info()
{	
	AI_Output (self, other,"DIA_Daron_Hallo_10_00");//¿En qué puedo servirte? ¿Buscas consuelo espiritual?
	AI_Output (self, other,"DIA_Daron_Hallo_10_01");//¿Quieres dirigir una oración a nuestro señor Innos, o donar algo de oro a su iglesia?
};

// ************************************************************
// 			  	Oberes Viertel - Paladine 
// ************************************************************
INSTANCE DIA_Daron_Paladine(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 2;
	condition	= DIA_Daron_Paladine_Condition;
	information	= DIA_Daron_Paladine_Info;
	permanent	= FALSE;
	description = "Debo hablar con los paladines...";
};                       
FUNC INT DIA_Daron_Paladine_Condition()
{	
	if (other.guild != GIL_KDF)
	&& (Kapitel < 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Paladine_Info()
{	
	AI_Output (other, self,"DIA_Daron_Paladine_15_00");//Tengo que hablar con los paladines. ¿Me ayudas a ponerme en contacto con ellos?
	AI_Output (self, other,"DIA_Daron_Paladine_10_01");//Bueno, tienes que acceder a la parte alta de la ciudad. Sin embargo, en ella solo pueden entrar ciudadanos y la guardia de la ciudad.
	AI_Output (self, other,"DIA_Daron_Paladine_10_02");//Y, por supuesto, nosotros, los magos del fuego.
	AI_Output (other, self,"DIA_Daron_Paladine_15_03");//¿Cómo puedo convertirme en mago del fuego?
	AI_Output (self, other,"DIA_Daron_Paladine_10_04");//Debes ingresar en la orden como novicio. Cuando lleves un tiempo en ella, quizás te admitan en las filas de los magos.
	AI_Output (self, other,"DIA_Daron_Paladine_10_05");//Sin embargo, el camino que lleva a la admisión es largo y hay que trabajar y estudiar mucho.
};

// ************************************************************
// 			  				About Segen 
// ************************************************************
INSTANCE DIA_Daron_AboutSegen (C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 2;
	condition	= DIA_Daron_AboutSegen_Condition;
	information	= DIA_Daron_AboutSegen_Info;
	permanent	= FALSE;
	description = "¡He venido para que me bendigas!";
};                       
FUNC INT DIA_Daron_AboutSegen_Condition()
{	
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	&& (Player_IsApprentice == APP_NONE)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_AboutSegen_Info()
{	
	AI_Output (other, self,"DIA_Daron_AboutSegen_15_00"); //¡He venido para que me bendigas!
	AI_Output (self, other,"DIA_Daron_AboutSegen_10_01"); //Bien, bien... entonces probablemente querrás donar oro a la santa iglesia de Innos, ¿no?
	AI_Output (other, self,"DIA_Daron_AboutSegen_15_02"); //En realidad, quería tu bendición para poder entrar como aprendiz en la parte baja de la ciudad...
	if (Daron_Segen == TRUE)
	{
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_03"); //Pero si ya te he dado mi bendición, hijo mío.
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_04"); //¡Ve con Innos, hijo mío!
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_05"); //¡Pero hijo mío...! Sin una donación modesta a la iglesia, me resulta imposible bendecirte.
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_06"); //Si no, ¿cómo voy a estar seguro de tus buenas intenciones hacia la santa iglesia de Innos?
	};
};

// ************************************************************
// 			  		Spenden
// ************************************************************
INSTANCE DIA_Daron_Spenden(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 3;
	condition	= DIA_Daron_Spenden_Condition;
	information	= DIA_Daron_Spenden_Info;
	permanent	= FALSE;
	description	= "¿A cuánto suelen ascender las donaciones por aquí?";
};                       
FUNC INT DIA_Daron_Spenden_Condition()
{	if (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Spenden_Info()
{	
	AI_Output (other, self,"DIA_Daron_Spenden_15_00");//¿A cuánto suelen ascender las donaciones por aquí?
	AI_Output (self, other,"DIA_Daron_Spenden_10_01");//Bueno, depende del porcentaje que quieras dar. A ver cuánto has traído.
	AI_Output (self, other,"DIA_Daron_Spenden_10_02");//(Busca en la bolsa del dinero) Mmmm, ummm...
	
	if (Npc_HasItems (other, ItMi_Gold) < 10)
	{
		AI_Output (self, other,"DIA_Daron_Spenden_10_03");//Eres un pobre diablo, ¿eh? Quédate con lo poco que tienes.
		
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, el mago de fuego, no me ha bendecido. Supongo que significa que tengo que conseguir algo de oro y donárselo para que lo haga.");
		};
	}
	else //Gold >= 10
	{
		if (Npc_HasItems (other, ItMi_Gold) < 50)
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_04");//Bueno, no tienes mucho, pero tampoco eres pobre. 10 monedas de oro para Innos. Vivimos humildemente.
			B_GiveInvItems (other, self, ItMi_Gold, 10);
			
		}
		else if (Npc_HasItems (other, ItMi_Gold) < 100)
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_05");//Tienes más de 50 monedas de oro. Dona 25 a Innos y recibe su bendición.
			B_GiveInvItems (other, self, ItMi_Gold, 25);
		}
		else
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_06");//Tienes más de cien monedas de oro. El señor dice: 'Si tienes, da'.
			AI_Output (self, other,"DIA_Daron_Spenden_10_07");//La iglesia acepta tu generoso donativo.
			B_GiveInvItems (other, self, ItMi_Gold, 50);
			
		};
		
		AI_Output (self, other,"DIA_Daron_Spenden_10_08");//Te bendigo en nombre de Innos, pues es justo y luminoso.
		Daron_Segen = TRUE;
		B_GivePlayerXP (XP_InnosSegen);
		
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, el mago de oro, me ha otorgado su bendición.");
		};
	};
};

// ************************************************************
// 			  Wo kommst du her?
// ************************************************************
INSTANCE DIA_Daron_Woher(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 9;
	condition	= DIA_Daron_Woher_Condition;
	information	= DIA_Daron_Woher_Info;
	permanent	= FALSE;
	description	= "¿De dónde vienes?";
};                       
FUNC INT DIA_Daron_Woher_Condition()
{	
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Woher_Info()
{	
	AI_Output (other, self,"DIA_Daron_Woher_15_00");//¿De dónde vienes?
	AI_Output (self, other,"DIA_Daron_Woher_10_01");//Vengo del monasterio de los magos, que está en las montañas.
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other,"DIA_Daron_Woher_10_02");//Allí aceptamos a todos los puros de corazón que sienten el deseo de servir a nuestro señor todopoderoso Innos.
	};
};

// ************************************************************
// 			Innos
// ************************************************************
INSTANCE DIA_Daron_Innos(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 9;
	condition	= DIA_Daron_Innos_Condition;
	information	= DIA_Daron_Innos_Info;
	permanent	= FALSE;
	description	= "Háblame de Innos.";
};                       
FUNC INT DIA_Daron_Innos_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Woher)
	&& (other.guild != GIL_KDF)
	&& (other.guild != GIL_DJG)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Innos_Info()
{	
	AI_Output (other, self,"DIA_Daron_Innos_15_00");//Háblame de Innos.
	AI_Output (self, other,"DIA_Daron_Innos_10_01");//Innos, nuestro señor todopoderoso, es la luz y el fuego.
	AI_Output (self, other,"DIA_Daron_Innos_10_02");//Escogió a los humanos para que fueran sus herramientas, y les dio la magia y las leyes.
	AI_Output (self, other,"DIA_Daron_Innos_10_03");//Actuamos en su nombre. Administramos justicia según su voluntad y predicamos su palabra.
};

// ************************************************************
// 			  Kloster
// ************************************************************
INSTANCE DIA_Daron_Kloster(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 9;
	condition	= DIA_Daron_Kloster_Condition;
	information	= DIA_Daron_Kloster_Info;
	permanent	= FALSE;
	description	= "Cuéntame algo más del monasterio.";
};                       
FUNC INT DIA_Daron_Kloster_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Woher)
	|| Npc_KnowsInfo (other, DIA_Daron_Paladine)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_KDF) 
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Kloster_Info()
{	
	AI_Output (other, self,"DIA_Daron_Kloster_15_00");//Cuéntame algo más del monasterio.
	AI_Output (self, other,"DIA_Daron_Kloster_10_01");//Enseñamos todos los aspectos de la magia a nuestros estudiantes, pero las artes de los magos del fuego se componen de más elementos.
	AI_Output (self, other,"DIA_Daron_Kloster_10_02");//También estamos versados en el arte de la alquimia, y en la creación de runas poderosas.
	AI_Output (self, other,"DIA_Daron_Kloster_10_03");//Además, elaboramos un vino magnífico.
};

// ************************************************************
// 			 Stadt
// ************************************************************
INSTANCE DIA_Daron_Stadt(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 99;
	condition	= DIA_Daron_Stadt_Condition;
	information	= DIA_Daron_Stadt_Info;
	permanent	= FALSE;
	description	= "¿Qué haces en la ciudad?";
};                       
FUNC INT DIA_Daron_Stadt_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Woher)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Stadt_Info()
{	
	AI_Output (other, self,"DIA_Daron_Stadt_15_00");//¿Qué haces en la ciudad?
	AI_Output (self, other,"DIA_Daron_Stadt_10_01");//Converso con los paladines y apoyo a los ciudadanos con consejos y palabras provechosas.
	AI_Output (self, other,"DIA_Daron_Stadt_10_02");//Sobre todo en estos tiempos difíciles, nuestra obligación es estar al lado del pueblo y ayudar a los pobres.
};

///////////////////////////////////////////////////////////////////////
//	Info GuildHelp
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_GuildHelp		(C_INFO)
{
	npc		 = 	KDF_511_Daron;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Daron_GuildHelp_Condition;
	information	 = 	DIA_Addon_Daron_GuildHelp_Info;

	description	 = 	"He oído rumores sobre una estatuilla…";
};

func int DIA_Addon_Daron_GuildHelp_Condition ()
{
	if (MIS_Addon_Vatras_Go2Daron == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Daron_Stadt))
		{
			return TRUE;
		};
};

func void DIA_Addon_Daron_GuildHelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_00"); //He oído rumores sobre una estatuilla que dicen que has perdido.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_01"); //¿De verdad? Sólo lo has podido oír de Vatras, el Mago de Agua.
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_02"); //¿Qué problema hay?
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_03"); //Han mandado desde el continente una estatuilla muy valiosa al monasterio, pero no ha llegado.
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_04"); //¿Han asaltado el barco?
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_05"); //(avergonzado) No. Llegó a Khorinis sano y salvo y yo fui a recogerlo.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_06"); //Entonces, de camino al monasterio, un grupo de trasgos se apoderó de él.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_07"); //(enfadado) Oye, no me mires así. Los magos también somos humanos, ¿sabes?
	
	MIS_Addon_Vatras_Go2Daron = LOG_SUCCESS;
	MIS_Addon_Daron_GetStatue = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Daron_GuildHelp);
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "¿Y dices que ahora la tienen los trasgos?", DIA_Addon_Daron_GuildHelp_gobbos );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "¿Dónde perdiste la estatuilla?", DIA_Addon_Daron_GuildHelp_wo );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "¿No intentaste recuperar la estatuilla?", DIA_Addon_Daron_GuildHelp_wiederholen );
};

func void DIA_Addon_Daron_GuildHelp_wiederholen ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_wiederholen_15_00"); //¿No intentaste recuperar la estatuilla?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_wiederholen_10_01"); //¡Pues claro que sí! La busqué por todas partes, pero sin resultado.
};

func void DIA_Addon_Daron_GuildHelp_gobbos ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_gobbos_15_00"); //¿Y dices que ahora la tienen los trasgos?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_gobbos_10_01"); //La robaron y se la llevaron por ahí.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_gobbos_10_02"); //No los he vuelto a ver. Probablemente anden atrincherados en algún agujero.
};

func void DIA_Addon_Daron_GuildHelp_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_wo_15_00"); //¿Dónde perdiste la estatuilla?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_wo_10_01"); //Estaba de camino al monasterio. Cerca de la taberna de Orlan.

	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Con eso me basta. Recuperaré la estatuilla.", DIA_Addon_Daron_GuildHelp_auftrag );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "¿La taberna de Orlan? ¿Y eso dónde está?", DIA_Addon_Daron_GuildHelp_woTaverne );
};

func void DIA_Addon_Daron_GuildHelp_woTaverne ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_woTaverne_15_00"); //¿La taberna de Orlan? ¿Y eso dónde está?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_woTaverne_10_01"); //Si sales de la ciudad por esta puerta y sigues el sendero, llegarás a una casa aislada de todo.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_woTaverne_10_02"); //Es la taberna de Orlan, 'La arpía feliz'.
};

func void DIA_Addon_Daron_GuildHelp_auftrag ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_auftrag_15_00"); //Con eso me basta. Recuperaré la estatuilla.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_auftrag_10_01"); //Que Innos te guíe y te proteja de los peligros que te esperan fuera de los límites de la ciudad.
	Info_ClearChoices	(DIA_Addon_Daron_GuildHelp);
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Unos trasgos impertinentes robaron a Daron. Desde entonces, echa en falta una valiosa estatuilla que se suponía que tenía que llevar al monasterio. Se dice que los trasgos se enconden en un agujero cerca de la taberna 'La arpía feliz'."); 
};

///////////////////////////////////////////////////////////////////////
//	Info FoundStatue
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_FoundStatue		(C_INFO)
{
	npc		 = 	KDF_511_Daron;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Daron_FoundStatue_Condition;
	information	 = 	DIA_Addon_Daron_FoundStatue_Info;

	description	 = 	"He encontrado tu estatuilla.";
};

func int DIA_Addon_Daron_FoundStatue_Condition ()
{
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (DIA_Gorax_GOLD_perm == FALSE) 
	&& (MIS_Addon_Daron_GetStatue == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Daron_FoundStatue_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Daron_FoundStatue_15_00"); //He encontrado tu estatuilla.
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_01"); //¡Loado sea Innos!
	AI_Output	(other, self, "DIA_Addon_Daron_FoundStatue_15_02"); //¿Y qué piensas hacer con ella?
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_03"); //Nada de nada. Sólo me ha traído mala suerte.
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_04"); //TÚ la llevarás en mi lugar al monasterio.
	if (other.guild == GIL_NONE)
	{
		AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_05"); //Por supuesto, no te dejarán entrar a menos que decidas dedicar el resto de tu vida a servir al monasterio.
		AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_06"); //Pero seguro que no te importa hacerlo con tal de prestarme ese servicio, ¿verdad?
	};
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_07"); //¡Ve con Innos, hijo mío!
};

///////////////////////////////////////////////////////////////////////
//	Info ReturnedStatue
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_ReturnedStatue		(C_INFO)
{
	npc		 = 	KDF_511_Daron;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Daron_ReturnedStatue_Condition;
	information	 = 	DIA_Addon_Daron_ReturnedStatue_Info;

	description	 = 	"He llevado tu estatuilla al monasterio.";
};

func int DIA_Addon_Daron_ReturnedStatue_Condition ()
{
	if (DIA_Gorax_GOLD_perm == TRUE) 
	&& (MIS_Addon_Daron_GetStatue == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Daron_ReturnedStatue_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Daron_ReturnedStatue_15_00"); //He llevado la estatuilla al monasterio. Ya puedes descansar.
	AI_Output	(self, other, "DIA_Addon_Daron_ReturnedStatue_10_01"); //Qué buenas noticias. Que Innos te proteja.
	AI_Output	(self, other, "DIA_Addon_Daron_ReturnedStatue_10_02"); //Toma esta pequeña muestra de mi gratitud, hijo.
	CreateInvItems (self, ItMi_Gold, 150);									
	B_GiveInvItems (self, other, ItMi_Gold, 150);
	TOPIC_End_RangerHelpKDF = TRUE;		
	B_GivePlayerXP (XP_Addon_ReportLostInnosStatue2Daron);
};

// ************************************************************
// 			arm
// ************************************************************
INSTANCE DIA_Daron_arm(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 10;
	condition	= DIA_Daron_arm_Condition;
	information	= DIA_Daron_arm_Info;
	permanent	= FALSE;
	description	= "¡Yo soy pobre!";
};                       
FUNC INT DIA_Daron_arm_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Stadt)
	&& (Npc_HasItems  (other, ItMi_Gold) < 10) 
	&& (other.guild == GIL_NONE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_arm_Info()
{	
	AI_Output (other, self,"DIA_Daron_arm_15_00");//¡Yo soy pobre!
	AI_Output (self, other,"DIA_Daron_arm_10_01");//Así que eres pobre. En estos tiempos, no me extraña. Toma este oro. Debería servirte de ayuda.
	AI_Output (self, other,"DIA_Daron_arm_10_02");//Pero si buscas trabajo, verás lo pronto que te llega el oro. Y en ese momento podrás ayudar a la iglesia de Innos, igual que ella te ha ayudado.
	
	B_GiveInvItems (self, other, ItMi_Gold, 20);
};

// ************************************************************
// 			 Immer wieder spenden 
// ************************************************************
INSTANCE DIA_Daron_Spende(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 990;
	condition	= DIA_Daron_Spende_Condition;
	information	= DIA_Daron_Spende_Info;
	permanent	= TRUE;
	description	= "Quiero hacer un donativo...";
};      
//-------------------------------------
var int DIA_Daron_Spende_permanent;
//-------------------------------------                 
FUNC INT DIA_Daron_Spende_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (DIA_Daron_Spende_permanent == FALSE)
	&& Npc_KnowsInfo (other,DIA_Daron_Spenden)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Spende_Info()
{	
	
	AI_Output (other, self,"DIA_Daron_Spende_15_00");//Quiero hacer un donativo...
	
	Info_ClearChoices (DIA_Daron_Spende);
	
	if (Daron_Spende < 1000)
	{
		Info_AddChoice 	(DIA_Daron_Spende,"Pero no traje oro suficiente... (VOLVER)",DIA_Daron_Spende_BACK);
		
		Info_AddChoice 	(DIA_Daron_Spende,"(50 de oro)",DIA_Daron_Spende_50);
		Info_AddChoice 	(DIA_Daron_Spende,"(100 de oro)",DIA_Daron_Spende_100);
		Info_AddChoice 	(DIA_Daron_Spende,"(200 de oro)",DIA_Daron_Spende_200);
	 }
	 else 
	 {
	 	AI_Output (self, other,"DIA_Daron_Spende_10_01");//Ya has donado más de 1000 monedas de oro.
	 	AI_Output (self, other,"DIA_Daron_Spende_10_02");//La bendición del señor Innos siempre sea contigo.
	 	
	 	DIA_Daron_Spende_permanent = TRUE;	
		B_DaronSegen ();
	 };
};
FUNC VOID DIA_Daron_Spende_BACK()
{
	AI_Output (other, self,"DIA_Daron_Spende_BACK_15_00"); //Pero si no he traído bastante oro...
	AI_Output (self, other,"DIA_Daron_Spende_BACK_10_01"); //No importa, hijo mío. Puedes donar todo lo que quieras más adelante.
	
	Info_ClearChoices (DIA_Daron_Spende);
};	
//----------------------------
var int Daron_Spende;
//----------------------------
FUNC VOID DIA_Daron_Spende_50()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 50)
	{
		AI_Output (self, other,"DIA_Daron_Spende_50_10_00");//Te bendigo en nombre de Innos, pues es justo y luminoso.
		Daron_Spende = (Daron_Spende + 50);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, el mago de oro, me ha otorgado su bendición.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_50_10_01");//Puedes donar en cualquier momento si has ganado suficiente oro.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};
FUNC VOID DIA_Daron_Spende_100()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (self, other,"DIA_Daron_Spende_100_10_00");//Innos, eres la luz que ilumina el sendero de los justos.
		AI_Output (self, other,"DIA_Daron_Spende_100_10_01");//En tu nombre bendigo a este hombre. Que tu luz le ilumine.
		Daron_Spende = (Daron_Spende + 100);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, el mago de oro, me ha otorgado su bendición.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_100_10_02");//El señor dice: si quieres orar, abre tu espíritu, y si quieres donar, trae tu donativo.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};
FUNC VOID DIA_Daron_Spende_200()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 200)
	{
		AI_Output (self, other,"DIA_Daron_Spende_200_10_00");//Innos, bendice a este hombre. Que tu luz le ilumine.
		AI_Output (self, other,"DIA_Daron_Spende_200_10_01");//Dale fuerzas para que se comporte con justicia.
		Daron_Spende = (Daron_Spende + 200);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, el mago de oro, me ha otorgado su bendición.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_200_10_02");//Si quieres donar tanto oro, deberías traerlo.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};


	
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Daron_PICKPOCKET (C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 900;
	condition	= DIA_Daron_PICKPOCKET_Condition;
	information	= DIA_Daron_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Daron_PICKPOCKET_Condition()
{
	C_Beklauen (47, 80);
};
 
FUNC VOID DIA_Daron_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Daron_PICKPOCKET);
	Info_AddChoice		(DIA_Daron_PICKPOCKET, DIALOG_BACK 		,DIA_Daron_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Daron_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Daron_PICKPOCKET_DoIt);
};

func void DIA_Daron_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Daron_PICKPOCKET);
};
	
func void DIA_Daron_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Daron_PICKPOCKET);
};










