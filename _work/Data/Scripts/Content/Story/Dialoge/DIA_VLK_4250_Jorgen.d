
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

INSTANCE DIA_Jorgen_KAP3_EXIT(C_INFO)
{
	npc			= VLK_4250_Jorgen;
	nr			= 999;
	condition	= DIA_Jorgen_KAP3_EXIT_Condition;
	information	= DIA_Jorgen_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jorgen_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jorgen_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Jorgen_PICKPOCKET (C_INFO)
{
	npc			= VLK_4250_Jorgen;
	nr			= 900;
	condition	= DIA_Jorgen_PICKPOCKET_Condition;
	information	= DIA_Jorgen_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Jorgen_PICKPOCKET_Condition()
{
	C_Beklauen (59, 70);
};
 
FUNC VOID DIA_Jorgen_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jorgen_PICKPOCKET);
	Info_AddChoice		(DIA_Jorgen_PICKPOCKET, DIALOG_BACK 		,DIA_Jorgen_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jorgen_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jorgen_PICKPOCKET_DoIt);
};

func void DIA_Jorgen_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jorgen_PICKPOCKET);
};
	
func void DIA_Jorgen_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jorgen_PICKPOCKET);
};
//*********************************************************************
//	Info Hallo 
//*********************************************************************
INSTANCE DIA_Jorgen_Hallo   (C_INFO)
{
	npc         = VLK_4250_Jorgen;
	nr          = 4;
	condition   = DIA_Jorgen_Hallo_Condition;
	information = DIA_Jorgen_Hallo_Info;
	permanent   = FALSE;
	important	= TRUE;
};

FUNC INT DIA_Jorgen_Hallo_Condition()
{
	if (Kapitel == 3) 
	&& (MIS_SCKnowsInnosEyeIsBroken == FALSE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jorgen_Hallo_Info()
{
	AI_Output (self ,other,"DIA_Jorgen_Hallo_07_00"); //�Eh, t�!

	if ((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF))
	{
		AI_Output (self ,other,"DIA_Jorgen_Hallo_07_01"); //Veo que perteneces al monasterio de los magos.
		AI_Output (other,self ,"DIA_Jorgen_Hallo_15_02"); //S�, �por qu�?
		AI_Output (self ,other,"DIA_Jorgen_Hallo_07_03"); //�Necesitas otro trabajador aqu�?
	}
	else
	{
		AI_Output (self ,other,"DIA_Jorgen_Hallo_07_04"); //Eh, t�, �has estado alguna vez en el monasterio?
		AI_Output (other,self ,"DIA_Jorgen_Hallo_15_05"); //Quiz�, �por qu�?
		AI_Output (self ,other,"DIA_Jorgen_Hallo_07_06"); //�Siguen aceptando gente?
	};

	AI_Output (self ,other,"DIA_Jorgen_Hallo_07_07"); //No sabr�a a otro sitio al que ir.
}; 

//*********************************************************************
//	Hast du einen Novizen hier vorbeirennen gesehen? 
//*********************************************************************
INSTANCE DIA_Jorgen_Novice   (C_INFO)
{
	npc         = VLK_4250_Jorgen;
	nr          = 6;
	condition   = DIA_Jorgen_Novice_Condition;
	information = DIA_Jorgen_Novice_Info;
	permanent   = FALSE;
	description	= "�Has visto pasar a un novicio?";
};

FUNC INT DIA_Jorgen_Novice_Condition()
{
	IF (MIS_NOVIZENCHASE == LOG_RUNNING)
	&& (Kapitel == 3) 
	&& (MIS_SCKnowsInnosEyeIsBroken == FALSE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jorgen_Novice_Info()
{
	AI_Output (other,self ,"DIA_Jorgen_Novice_15_00"); //�Has visto pasar a un novicio?
	AI_Output (self ,other,"DIA_Jorgen_Novice_07_01"); //S�, claro. Se fue por all�.
	AI_PointAt	(self,"NW_TROLLAREA_NOVCHASE_01");
	AI_Output (self,other,"DIA_Jorgen_Novice_07_02"); //Salt� al agua desde el puente y sali� nadando como si le persiguiera un tibur�n.
	AI_StopPointAt(self);
}; 

//*********************************************************************
//	Wenn du ins Kloster willst, solltest du mir Milten reden. 
//*********************************************************************
INSTANCE DIA_Jorgen_Milten   (C_INFO)
{
	npc         = VLK_4250_Jorgen;
	nr          = 5;
	condition   = DIA_Jorgen_Milten_Condition;
	information = DIA_Jorgen_Milten_Info;
	permanent   = FALSE;
	description	= "Si te diriges al monasterio, deber�as hablar con Milten...";
};

FUNC INT DIA_Jorgen_Milten_Condition()
{
	if (Kapitel == 3) 
	&& (MIS_SCKnowsInnosEyeIsBroken == FALSE)
	&& (MIS_OLDWORLD == LOG_SUCCESS)
	&& (MiltenNW.aivar[AIV_TalkedToPlayer] == TRUE)
	{
			return TRUE;
	};
};

FUNC VOID DIA_Jorgen_Milten_Info()
{
	AI_Output (other,self ,"DIA_Jorgen_Milten_15_00"); //Si te diriges al monasterio, deber�as hablar con Milten. Seguro que �l podr� ayudarte.
	AI_Output (self ,other,"DIA_Jorgen_Milten_07_01"); //�Qu� piensas?, �me dejar�n entrar?
	AI_Output (other,self ,"DIA_Jorgen_Milten_15_02"); //Quiz�. Pero con tu aspecto, me cuesta imaginarte con una t�nica de novicio.
	AI_Output (self ,other,"DIA_Jorgen_Milten_07_03"); //Basta de tonter�as y de t�nicas de novicios. Lo que necesito es comida, o tendr� que empezar a comerme la corteza de los �rboles.
}; 

//*********************************************************************
//	DIA_Jorgen_Home
//*********************************************************************

INSTANCE DIA_Jorgen_Home   (C_INFO)
{
	npc         = VLK_4250_Jorgen;
	nr          = 7;
	condition   = DIA_Jorgen_Home_Condition;
	information = DIA_Jorgen_Home_Info;

	description	= "�De d�nde vienes?";
};

FUNC INT DIA_Jorgen_Home_Condition()
{
	if (Kapitel >= 3) 
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jorgen_Home_Info()
{
	AI_Output (other,self ,"DIA_Jorgen_Home_15_00"); //�De d�nde vienes?
	AI_Output (self ,other,"DIA_Jorgen_Home_07_01"); //Era capit�n de un gran ballenero, chico. El mar es mi hogar.
	AI_Output (self ,other,"DIA_Jorgen_Home_07_02"); //Mi barco, el viejo Magdalena, fue hundido por los piratas hace pocos meses, y ahora estoy bloqueado aqu�.
	AI_Output (self ,other,"DIA_Jorgen_Home_07_03"); //Lo �nico que quer�a era volver al mar, pero desde que llevo aqu�, no ha atracado en este maldito puerto ni una triste goleta.
	AI_Output (self ,other,"DIA_Jorgen_Home_07_04"); //El �nico barco anclado en Khorinis es este maldito gale�n de guerra del Rey y no admiten a nadie.
	AI_Output (self ,other,"DIA_Jorgen_Home_07_05"); //�Qu� m�s puedo hacer? No hay trabajo para m� en la ciudad. Lo he intentado todo.
	
}; 

//*********************************************************************
//	DIA_Jorgen_BeCarefull
//*********************************************************************
INSTANCE DIA_Jorgen_BeCarefull   (C_INFO)
{
	npc         = VLK_4250_Jorgen;
	nr          = 8;
	condition   = DIA_Jorgen_BeCarefull_Condition;
	information = DIA_Jorgen_BeCarefull_Info;
	permanent   = TRUE;
	description	= "Ser�a mejor que te salieras de la carretera.";
};

FUNC INT DIA_Jorgen_BeCarefull_Condition()
{
	if (Kapitel == 3) 
		&& (Npc_KnowsInfo(other, DIA_Jorgen_Home))
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jorgen_BeCarefull_Info()
{
	AI_Output (other,self ,"DIA_Jorgen_BeCarefull_15_00"); //Ser�a mejor que te salieras de la carretera.
	AI_Output (self ,other,"DIA_Jorgen_BeCarefull_07_01"); //No te preocupes. Ya me he dado cuenta de que esta �rea salvaje se ha hecho extremadamente peligrosa en los �ltimos d�as.
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

INSTANCE DIA_Jorgen_KAP4_EXIT(C_INFO)
{
	npc			= VLK_4250_Jorgen;
	nr			= 999;
	condition	= DIA_Jorgen_KAP4_EXIT_Condition;
	information	= DIA_Jorgen_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jorgen_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jorgen_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info NeuHier
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_NEUHIER		(C_INFO)
{	
	npc		 	= 	VLK_4250_Jorgen;
	nr		 	= 	41;
	condition	= 	DIA_Jorgen_NEUHIER_Condition;
	information	= 	DIA_Jorgen_NEUHIER_Info;

	description	= 	"�C�mo es la vida en el monasterio?";
};

func int DIA_Jorgen_NEUHIER_Condition ()
{
	if (Kapitel >= 4)	
	{
		return TRUE;
	};
};

func void DIA_Jorgen_NEUHIER_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_NEUHIER_15_00"); //�C�mo es la vida en el monasterio?
	
	AI_Output			(self, other, "DIA_Jorgen_NEUHIER_07_01"); //�Me estoy volviendo loco aqu�!

	if (Npc_KnowsInfo(other, DIA_Jorgen_Milten))
	{
		AI_Output			(self, other, "DIA_Jorgen_NEUHIER_07_02"); //Pero, de todas formas, gracias por la sugerencia. Milten me ayud� realmente a conseguir un lugar aqu�.
		B_GivePlayerXP (XP_Ambient);
	};

	if (hero.guild != GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Jorgen_NEUHIER_07_03"); //Me siento realmente est�pido entre esos buenazos dormilones.
	};

	AI_Output			(self, other, "DIA_Jorgen_NEUHIER_07_04"); //Bueno, �qu� voy a hacer con este cuerpo? Antes que morirme de hambre en la ciudad, prefiero hacer lo que me digan los novicios.
};

///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_PERM4		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	400;
	condition	 = 	DIA_Jorgen_PERM4_Condition;
	information	 = 	DIA_Jorgen_PERM4_Info;
	permanent	 = 	TRUE;

	description	 = 	"Creo que estar�s bien.";
};

func int DIA_Jorgen_PERM4_Condition ()
{
	if (Kapitel >= 4)	
		&&	(Npc_KnowsInfo(other, DIA_Jorgen_Home))
		&&	(Npc_KnowsInfo(other, DIA_Jorgen_NEUHIER))
		&& 	(JorgenIsCaptain == FALSE)
		{
				return TRUE;
		};
};
var int DIA_Jorgen_PERM4_OneTime;
func void DIA_Jorgen_PERM4_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_PERM4_15_00"); //Creo que estar�s bien.
	if (DIA_Jorgen_PERM4_OneTime == FALSE)
	&& (hero.guild != GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Jorgen_PERM4_07_01"); //Imag�nate: se supone que debo desbrozar su jard�n. Si esto dura mucho m�s, me volver� majara.
		DIA_Jorgen_PERM4_OneTime = TRUE;
	};
	
	AI_Output			(self, other, "DIA_Jorgen_PERM4_07_02"); //Lo que necesito es unos buenos tablones bajo mis pies.
};

//#####################################################################
//##
//##
//##					KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Jorgen_KAP5_EXIT(C_INFO)
{
	npc			= VLK_4250_Jorgen;
	nr			= 999;
	condition	= DIA_Jorgen_KAP5_EXIT_Condition;
	information	= DIA_Jorgen_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jorgen_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jorgen_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_BEMYCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	51;
	condition	 = 	DIA_Jorgen_BEMYCAPTAIN_Condition;
	information	 = 	DIA_Jorgen_BEMYCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Quiz� podr�a ofrecerte un trabajo como capit�n.";
};

func int DIA_Jorgen_BEMYCAPTAIN_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		&& (MIS_PyrokarClearDemonTower != LOG_SUCCESS)
		&& (Npc_KnowsInfo(other, DIA_Jorgen_Home))

		{
				return TRUE;
		};
};
var int DIA_Jorgen_BEMYCAPTAIN_OneTime;
func void DIA_Jorgen_BEMYCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_BEMYCAPTAIN_15_00"); //Quiz� podr�a ofrecerte un trabajo como capit�n.
	if (DIA_Jorgen_BEMYCAPTAIN_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN_07_01"); //�No me enga�as, colega? Si lo que dices es cierto, acepto seguro.
		AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN_07_02"); //Esto... solo hay un problema menor. Me com� la mitad de la despensa de esos novicios.
		AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN_07_03"); //Est�n enfurecidos. No creo que el mago jefe me deje irme de aqu� as� por las buenas.
		DIA_Jorgen_BEMYCAPTAIN_OneTime = TRUE;
	};
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN_07_04"); //Primero tengo que saldar mi deuda con Pyrokar. Lo siento.
	
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                                                                                                                                            
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                                                                                                                                          
    B_LogEntry (TOPIC_Captain,"Jorgen est� dispuesto a ser mi capit�n, pero antes tengo que pagar sus deudas con el monasterio.");

};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain2
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_BEMYCAPTAIN2		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	52;
	condition	 = 	DIA_Jorgen_BEMYCAPTAIN2_Condition;
	information	 = 	DIA_Jorgen_BEMYCAPTAIN2_Info;

	description	 = 	"Ya me ocup� de tu deuda.";
};

func int DIA_Jorgen_BEMYCAPTAIN2_Condition ()
{
	if (MIS_PyrokarClearDemonTower == LOG_SUCCESS)
		{
				return TRUE;
		};
};

func void DIA_Jorgen_BEMYCAPTAIN2_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_BEMYCAPTAIN2_15_00"); //Ya me ocup� de tu deuda. Eres libre.
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN2_07_01"); //�En serio? �C�mo lo hiciste?
	AI_Output			(other, self, "DIA_Jorgen_BEMYCAPTAIN2_15_02"); //No querr�s saberlo.
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN2_07_03"); //Oh, bueno. Tampoco es que me importe. Un mill�n de gracias otra vez.

	if (SCGotCaptain == FALSE)
	{
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN2_07_04"); //Ahora, �qu� hay de tu oferta? �A�n puedo irme contigo?
	}
	else
	{
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN2_07_05"); //Genial. Y ahora, �nos vamos!
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"RausAusKloster");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain3
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_BEMYCAPTAIN3		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	53;
	condition	 = 	DIA_Jorgen_BEMYCAPTAIN3_Condition;
	information	 = 	DIA_Jorgen_BEMYCAPTAIN3_Info;

	description	 = 	"S� mi capit�n.";
};

func int DIA_Jorgen_BEMYCAPTAIN3_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jorgen_BEMYCAPTAIN2))
		&& (SCGotCaptain == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Jorgen_BEMYCAPTAIN3_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_BEMYCAPTAIN3_15_00"); //S� mi capit�n.
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN3_07_01"); //Me siento honrado, pero �ya tienes barco y tripulaci�n?
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN3_07_02"); //Dir�a que necesitaremos al menos cinco hombres.
	AI_Output			(other, self, "DIA_Jorgen_BEMYCAPTAIN3_15_03"); //Bien. Ver� lo que puedo hacer. Esp�rame en el puerto.
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN3_07_04"); //S�, se�or.
	AI_StopProcessInfos (self);
	SCGotCaptain = TRUE;
	JorgenIsCaptain = TRUE;
	Npc_ExchangeRoutine	(self,"WaitForShipCaptain");
	
	B_GivePlayerXP (XP_Captain_Success);
};

///////////////////////////////////////////////////////////////////////
//	Info Losfahren
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_LOSFAHREN		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	59;
	condition	 = 	DIA_Jorgen_LOSFAHREN_Condition;
	information	 = 	DIA_Jorgen_LOSFAHREN_Info;
	permanent	 = 	TRUE;

	description	 = 	"�Est�s listo para llevarme a la isla?";
};

func int DIA_Jorgen_LOSFAHREN_Condition ()
{
	if (JorgenIsCaptain == TRUE)
		&& (MIS_ReadyforChapter6 ==	FALSE)
		{
				return TRUE;
		};
};

func void DIA_Jorgen_LOSFAHREN_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_LOSFAHREN_15_00"); //�Est�s listo para llevarme a la isla?

	if ((B_CaptainConditions (self)) == TRUE)
	{
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_01"); //Por supuesto. Dame ese mapa.
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_02"); //Genial. Izad las velas, nos vamos de aqu�.
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_03"); //Ser� mejor que compruebes tus cosas primero. Una vez que salgamos al mar, no habr� vuelta atr�s.
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_04"); //Cuando hayas terminado, deber�as dormir un poco. Hay una cama lista para ti en las habitaciones del capit�n. Buenas noches.
	AI_StopProcessInfos (self);
	B_CaptainCallsAllOnBoard (self);
	}
	else
	{
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_05"); //Necesitas un barco, una tripulaci�n m�nima de 5 hombres y una carta de navegaci�n que pueda usar para navegar.
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_06"); //No vamos a levar anclas hasta que vea que tienes todo lo que necesitas.
	AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info perm5_NotCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_PERM5_NOTCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	59;
	condition	 = 	DIA_Jorgen_PERM5_NOTCAPTAIN_Condition;
	information	 = 	DIA_Jorgen_PERM5_NOTCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"�Qu� tal est�s?";
};

func int DIA_Jorgen_PERM5_NOTCAPTAIN_Condition ()
{
	if	(Npc_KnowsInfo(other, DIA_Jorgen_BEMYCAPTAIN2))
		&& 	(SCGotCaptain == TRUE)
		&&	(JorgenIsCaptain == FALSE)
		{
				return TRUE;
		};
};
var int DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven;
func void DIA_Jorgen_PERM5_NOTCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_PERM5_NOTCAPTAIN_15_00"); //�Qu� tal est�s?

	if 	(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_OUT_06")<1000)  
	{
	AI_Output			(self, other, "DIA_Jorgen_PERM5_NOTCAPTAIN_07_01"); //Bien. �ste no es un mal sitio.
	AI_Output			(self, other, "DIA_Jorgen_PERM5_NOTCAPTAIN_07_02"); //Me siguen encargando tareas est�pidas, como cuidar de las ovejas, pero aqu� no son ni la mitad de obtusos que en el monasterio.

		if (DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven == FALSE)
		{
		B_GivePlayerXP (XP_Ambient);
		DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven = TRUE;
		};
	AI_StopProcessInfos (self);
	}
	else
	{
	AI_Output			(self, other, "DIA_Jorgen_PERM5_NOTCAPTAIN_07_03"); //Tendr� que buscar otro sitio en el que quedarme. Veamos d�nde me lleva el aire.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"RausAusKloster");
	};
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


INSTANCE DIA_Jorgen_KAP6_EXIT(C_INFO)
{
	npc			= VLK_4250_Jorgen;
	nr			= 999;
	condition	= DIA_Jorgen_KAP6_EXIT_Condition;
	information	= DIA_Jorgen_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jorgen_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jorgen_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};












































