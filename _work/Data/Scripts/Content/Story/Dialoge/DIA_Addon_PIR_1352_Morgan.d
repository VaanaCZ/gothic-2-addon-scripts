// ************************************************************
// 			  				   EXIT 
// ************************************************************
var int Morgan_Perm_Counter;
// ------------------------------------------------------------
INSTANCE DIA_Addon_Morgan_EXIT(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 999;
	condition	= DIA_Addon_Morgan_EXIT_Condition;
	information	= DIA_Addon_Morgan_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Morgan_EXIT_Condition()
{
	return TRUE;
};
func int DIA_Addon_Morgan_EXIT_Info ()
{
	if (GregIsBack == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Morgan_Perm_15_00"); //Vuelve a echarte.
		if (Morgan_Perm_Counter == 0)
		{
			AI_Output	(self, other, "DIA_Addon_Morgan_Perm_07_01"); //(bostezando) Buena idea.
			Morgan_Perm_Counter = 1;
		}
		else if (Morgan_Perm_Counter == 1)
		{
			AI_Output	(self, other, "DIA_Addon_Morgan_Perm_07_02"); //(somnoliento) Vale, pues muy bien.
			Morgan_Perm_Counter = 2;
		}
		else if (Morgan_Perm_Counter == 2)
		{
			AI_Output	(self, other, "DIA_Addon_Morgan_Perm_07_03"); //(cansado) Ser� todo un placer.
			Morgan_Perm_Counter = 3;
		}
		else if (Morgan_Perm_Counter == 3)
		{
			AI_Output	(self, other, "DIA_Addon_Morgan_Perm_07_04"); //Despi�rtame si pasa algo.
			Morgan_Perm_Counter = 0;
		};
	};
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Morgan_PICKPOCKET (C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 900;
	condition	= DIA_Addon_Morgan_PICKPOCKET_Condition;
	information	= DIA_Addon_Morgan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Morgan_PICKPOCKET_Condition()
{
	C_Beklauen (20, 43);
};
 
FUNC VOID DIA_Addon_Morgan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Morgan_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Morgan_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Morgan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Morgan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Morgan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Morgan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Morgan_PICKPOCKET);
};
	
func void DIA_Addon_Morgan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Morgan_PICKPOCKET);
};
// ************************************************************
// 		  				  NICHT Anheuern
// ************************************************************
instance DIA_Addon_Morgan_Anheuern(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 1;
	condition	= DIA_Addon_Morgan_Anheuern_Condition;
	information	= DIA_Addon_Morgan_Anheuern_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Morgan_Anheuern_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (GregIsBack == TRUE)
	{
		return TRUE;
	};
};
func int DIA_Addon_Morgan_Anheuern_Info ()
{
	AI_Output (self, other, "DIA_Addon_Morgan_Anheuern_07_00"); //�Genial, ahora Greg me ha puesto a serrar tablas!
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Morgan_Anheuern_07_01"); //(sarc�stico) �Que te lo pases bien matando monstruos!
	};
};

// ************************************************************
// 			  				  Hallo
// ************************************************************
INSTANCE DIA_Addon_Morgan_Hello(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 1;
	condition	= DIA_Addon_Morgan_Hello_Condition;
	information	= DIA_Addon_Morgan_Hello_Info;
	permanent 	= TRUE;
	important	= TRUE;
};                      
FUNC INT DIA_Addon_Morgan_Hello_Condition()
{
	IF (MIS_AlligatorJack_BringMeat == FALSE)
	&& (Npc_IsInState (self,ZS_Talk))
	&& ((Npc_IsDead(AlligatorJack)) == FALSE)
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Morgan_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_Hello_15_00"); //�Eh, t�!
	AI_Output (self ,other,"DIA_Addon_Morgan_Hello_07_01"); //(somnoliento) �Eh? �Qu� quieres?
	AI_Output (self ,other,"DIA_Addon_Morgan_Hello_07_02"); //(somnoliento) �Entonces ha vuelto Caim�n Jack?
	AI_Output (self ,other,"DIA_Addon_Morgan_Hello_07_03"); //(somnoliento) �No? Pues seguro que est� al caer. Buenas noches.
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  		 Fleisch von Alli-Jack
// ************************************************************
INSTANCE DIA_Addon_Morgan_Meat(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 2;
	condition	= DIA_Addon_Morgan_Meat_Condition;
	information	= DIA_Addon_Morgan_Meat_Info;

	description	= "He venido a entregar un env�o de carne.";
};                       
FUNC INT DIA_Addon_Morgan_Meat_Condition()
{
	IF (MIS_AlligatorJack_BringMeat == LOG_RUNNING)
	&& (Npc_HasItems (other,ItFoMuttonRaw) >= 1)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Morgan_Meat_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_Meat_15_00"); //He venido a entregar un env�o de carne.

	if (GregIsBack == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Morgan_Meat_07_01"); //(despej�ndose) Argh. Necesito un trago para despertarme.
		
		CreateInvItems (self, ItFo_Booze, 3);									
		B_UseItem (self,ItFo_Booze);
		
		AI_Output (self ,other,"DIA_Addon_Morgan_Meat_07_02"); //Eso est� mejor. A ver, �qu� quer�as?
		AI_Output (other,self ,"DIA_Addon_Morgan_Meat_15_03"); //He venido a traeros carne. De parte de Caim�n Jack.
	};

	AI_Output (self ,other,"DIA_Addon_Morgan_Meat_07_04"); //Ya me acuerdo. �Perfecto! �La carne! D�mela.
	
	var int GivenMeat; GivenMeat = Npc_HasItems (other, ItFoMuttonRaw);
	
	if (GivenMeat > 10)
	{
		GivenMeat = 10;
	};
	
	B_GiveInvItems (other,self,ItFoMuttonRaw, GivenMeat);
	
	if (GivenMeat < 10)
	{
		AI_Output (self ,other,"DIA_Addon_Morgan_Meat_07_05"); //�Y esto es todo? T� te has comido el resto, �eh? Oh, bueno, tranquilo
	};
	
	B_LogEntry (TOPIC_Addon_BringMeat,"Le he llevado a Morgan la carne.");
	
	MIS_AlligatorJack_BringMeat = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_ALLIGatORJACK_BringMeat);
};

// ************************************************************
// 			 				Hallo 2 (Job)
// ************************************************************
INSTANCE DIA_Addon_Morgan_Job(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 3;
	condition	= DIA_Addon_Morgan_Job_Condition;
	information	= DIA_Addon_Morgan_Job_Info;

	description	= "�Qu� est�s haciendo aqu�?";
};                       
FUNC INT DIA_Addon_Morgan_Job_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Morgan_Meat))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Morgan_Job_Info()
{	
	AI_Output (other, self, "DIA_Addon_Morgan_Job_15_01"); //�Qu� est�s haciendo aqu�?
	AI_Output (self, other, "DIA_Addon_Morgan_Job_07_01"); //Greg me ha hecho comandante de uno de los dos grupos de asalto.
	AI_Output (self, other, "DIA_Addon_Morgan_Job_07_02"); //Soy el encargado de mantener el campamento abastecido, Caim�n Jack se ocupa de ello.
	AI_Output (self, other, "DIA_Addon_Morgan_Job_07_03"); //Tambi�n soy el encargado de mantener a esas bestias que hay por aqu� lejos del campamento.
	AI_Output (self, other, "DIA_Addon_Morgan_Job_07_04"); //De eso se ocupan mis HOMBRES.
	if (GregIsBack == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Morgan_Job_07_05"); //Les dije que no quer�a ver ni una bestia rondando la zona (bosteza) cuando Greg volviera.
	};
};

// ************************************************************
// 			 			Faule Sau --> Lehrer		  
// ************************************************************
INSTANCE DIA_Addon_Morgan_Sleep(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 4;
	condition	= DIA_Addon_Morgan_Sleep_Condition;
	information	= DIA_Addon_Morgan_Sleep_Info;

	description	= "�Y t� haces algo alguna vez?";
};                       
FUNC INT DIA_Addon_Morgan_Sleep_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Morgan_Job))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Morgan_Sleep_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_Sleep_15_00"); //�Y t� haces algo alguna vez?
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_01"); //�Eh, cuidado con lo que dices!
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_02"); //Mi cometido es el m�s fundamental.
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_03"); //Entreno a mi gente.
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_04"); //Los convierto en los mejores y m�s temerarios luchadores que hayan surcado estos mares.
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_05"); //Y no te creas que mis hombres hacen todo ese trabajo a cambio de nada.
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_06"); //Ganan una buena bolsa de oro por su esfuerzo.
};

// ************************************************************
// ***														***
// 							Entertrupp
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 						Ich will mitmachen!
// ------------------------------------------------------------
instance DIA_Addon_Morgan_JoinMorgan(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 5;
	condition	= DIA_Addon_Morgan_JoinMorgan_Condition;
	information	= DIA_Addon_Morgan_JoinMorgan_Info;

	description	= "Quiero unirme a tus tropas.";
};                       
FUNC INT DIA_Addon_Morgan_JoinMorgan_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Morgan_Sleep))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Morgan_JoinMorgan_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_JoinMorgan_15_00"); //Quiero unirme a tus tropas.
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_01"); //(r�e) �Mis tropas? Mis tropas est�n en la playa.
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_03"); //Esos chicos no piensan levantar un dedo hasta que no vuelva el Capit�n, eso dalo por seguro.
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_04"); //Pero si quieres demostrarle a todos lo que vales, puedes ocuparte de la playa del norte.
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_05"); //Est� llena de acechadores y dios sabe qu� m�s.
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_06"); //Acaba con todos t� solo y te ganar�s el respeto (bosteza) de todo el mundo
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_07"); //Bienvenido a mi ej�rcito. �Ja! Voy a tumbarme
	
	Log_CreateTopic (TOPIC_Addon_MorganBeach,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_MorganBeach,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MorganBeach,"Ahora que soy de las tropas de asalto de Morgan, quiere que despeje la playa norte de bestias.");
	
	MIS_Addon_MorganLurker = LOG_RUNNING;
	AI_StopProcessInfos (self);
};

// ------------------------------------------------------------
// 							LurkerPlatt
// ------------------------------------------------------------
instance DIA_Addon_Morgan_LurkerPlatt		(C_INFO)
{
	npc		 	= PIR_1353_Addon_Morgan;
	nr		 	= 6;
	condition	= DIA_Addon_Morgan_LurkerPlatt_Condition;
	information	= DIA_Addon_Morgan_LurkerPlatt_Info;
	permanent	= TRUE;
	description	= "La playa del norte est� despejada.";
};
func int DIA_Addon_Morgan_LurkerPlatt_Condition ()
{
	if (Npc_IsDead(BeachLurker1))
	&& (Npc_IsDead(BeachLurker2))
	&& (Npc_IsDead(BeachLurker3))
	&& (Npc_IsDead(BeachWaran1))
	&& (Npc_IsDead(BeachWaran2))
	&& (MIS_Addon_MorganLurker == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Morgan_LurkerPlatt_Info ()
{
	AI_Output (other, self, "DIA_Addon_Morgan_LurkerPlatt_15_00"); //La playa del norte est� despejada.
	AI_Output (self, other, "DIA_Addon_Morgan_LurkerPlatt_07_01"); //�Y la cueva? �has estado all� tambi�n?
		
	if (Npc_IsDead(BeachShadowbeast1))
	{
		AI_Output	(other, self, "DIA_Addon_Morgan_LurkerPlatt_15_02"); //Pues claro.
		AI_Output	(self, other, "DIA_Addon_Morgan_LurkerPlatt_07_03"); //Fant�stico. Eres un gran hombre.
		AI_Output	(self, other, "DIA_Addon_Morgan_LurkerPlatt_07_04"); //Aqu� tienes tu recompensa.
		CreateInvItems (self, ItMi_Gold, 150);									
		B_GiveInvItems (self, other, ItMi_Gold, 150);
		
		B_LogEntry (TOPIC_Addon_MorganBeach,"La playa est� limpia. He fulminado a todas las bestias.");
		
		MIS_Addon_MorganLurker = LOG_SUCCESS;
				
		B_GivePlayerXP (XP_Addon_Morgan_LurkerPlatt);
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Morgan_LurkerPlatt_15_05"); //Estooo
		AI_Output	(self, other, "DIA_Addon_Morgan_LurkerPlatt_07_06"); //Pues tambi�n es parte de la zona. Vuelve cuando hayas acabado.
		
		B_LogEntry (TOPIC_Addon_MorganBeach,"Morgan quiere que me ocupe tambi�n de la cueva.");
		
		AI_StopProcessInfos (self);
	};
};

// ------------------------------------------------------------
//						Sonst noch Auftrag?
// ------------------------------------------------------------
instance DIA_Addon_Morgan_Auftrag2		(C_INFO)
{
	npc		 	= PIR_1353_Addon_Morgan;
	nr		 	= 99;
	condition	= DIA_Addon_Morgan_Auftrag2_Condition;
	information	= DIA_Addon_Morgan_Auftrag2_Info;
	permanent	= TRUE;
	description	= "�Tengo que hacer algo m�s?";
};
func int DIA_Addon_Morgan_Auftrag2_Condition ()
{
	if (MIS_Addon_MorganLurker == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Addon_Morgan_Auftrag2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Morgan_Auftrag2_15_00"); //�Me queda algo por hacer?

	if (GregIsBack == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Morgan_Auftrag2_07_01"); //De momento, no.
		AI_Output	(self, other, "DIA_Addon_Morgan_Auftrag2_07_02"); //�Ve a buscarte una cama y coge una buena botella de ron!
		CreateInvItems (self, ItFo_Booze, 3);									
		B_UseItem (self,ItFo_Booze);
		AI_Output	(self, other, "DIA_Addon_Morgan_Auftrag2_07_03"); //Aaah. Buena calidad.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Morgan_Auftrag2_07_04"); //Ser� mejor que preguntes al Capit�n.
	};
	
	AI_StopProcessInfos (self);
};



//**************************************************
//				Angus und Hank (Ring)
//**************************************************
var int Morgan_AngusStory;
//--------------------------------------------------
instance DIA_Addon_Morgan_FOUNDTHEM(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 7;
	condition	= DIA_Addon_Morgan_FOUNDTHEM_Condition;
	information	= DIA_Addon_Morgan_FOUNDTHEM_Info;
	permanent	= TRUE;
	description	= "Sobre Angus y Hank�";
};                       
FUNC INT DIA_Addon_Morgan_FOUNDTHEM_Condition()
{
	if (MIS_Addon_Morgan_SeekTraitor != LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_AngusHank))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Morgan_FOUNDTHEM_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_FOUNDTHEM_15_00"); //Sobre Angus y Hank
	
	if (Morgan_AngusStory == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_01"); //No me LOS recuerdes.
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_02"); //Probablemente los hayan matado los piratas.
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_03"); //Y Angus llevaba mi anillo.
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_04"); //Cierto es que era SU anillo, en parte. Me lo gan� jugando a los dados.
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_05"); //�Pero lo hubiera recuperado y ahora lo HE PERDIDO!
		Morgan_AngusStory = TRUE;
	};

	Info_ClearChoices (DIA_Addon_Morgan_FOUNDTHEM);
	if (Npc_HasItems (other, ItRi_Addon_MorgansRing_Mission) > 0)
	{
		Info_AddChoice (DIA_Addon_Morgan_FOUNDTHEM, "Los he encontrado.", DIA_Addon_Morgan_FOUNDTHEM_Now);
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_06"); //Si encuentras mi anillo, tr�emelo. �Te recompensar�!
	};
};
func void DIA_Addon_Morgan_FOUNDTHEM_Now()
{
	AI_Output (other,self ,"DIA_Addon_Morgan_FOUNDTHEM_15_01"); //Los he encontrado.
	AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_07"); //Pues dime, �d�nde est�n?
	AI_Output (other,self ,"DIA_Addon_Morgan_FOUNDTHEM_15_03"); //Est�n muertos.
	AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_08"); //El anillo, �qu� hay del anillo?
	Info_ClearChoices (DIA_Addon_Morgan_FOUNDTHEM);
	Info_AddChoice (DIA_Addon_Morgan_FOUNDTHEM,"Aqu� tienes.",DIA_Addon_Morgan_FOUNDTHEM_GiveRing);
	Info_AddChoice (DIA_Addon_Morgan_FOUNDTHEM,"No lo ten�an.",DIA_Addon_Morgan_FOUNDTHEM_NoRing);
};
func void DIA_Addon_Morgan_FOUNDTHEM_NoRing()
{
	AI_Output (other,self ,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_15_00"); //No lo ten�an.
	AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_01"); //(horrorizado) �Qu�? Vuelve a buscarlo. Tienen que tenerlo.
	AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_02"); //Es un anillo peque�o muy adornado.
	AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_03"); //TIENES que encontrarlo. �Es CRUCIAL!
	Info_ClearChoices (DIA_Addon_Morgan_FOUNDTHEM);
};
func void DIA_Addon_Morgan_FOUNDTHEM_GiveRing()
{
	AI_Output (other, self ,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_15_00"); //Aqu� tienes.
	B_GiveInvItems (other, self ,ItRi_Addon_MorgansRing_Mission,1);
	AI_Output (self, other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_01"); //(feliz como un ni�o) S�, es este. �Eres mi h�roe!
	AI_Output (self, other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_02"); //Toma, una tablilla de piedra. No parece muy valiosa, pero Garett te dar� una buena cantidad de oro a cambio.
	
	MIS_Addon_Morgan_SeekTraitor = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_MorgansRing);
	Info_ClearChoices (DIA_Addon_Morgan_FOUNDTHEM);
	
	//PATCH M.F.
	B_GiveInvItems (self, other, ItWr_StonePlateCommon_Addon,1);
};



//**************************************************
//			Francis
//**************************************************

INSTANCE DIA_Addon_Morgan_Francis(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 5;
	condition	= DIA_Addon_Morgan_Francis_Condition;
	information	= DIA_Addon_Morgan_Francis_Info;

	description	= "�Qu� opinas de Francis?";
};                       
FUNC INT DIA_Addon_Morgan_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			return TRUE;
		};
	};	
};

FUNC VOID DIA_Addon_Morgan_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_Francis_15_00"); //�Qu� opinas de Francis?
	AI_Output (self ,other,"DIA_Addon_Morgan_Francis_07_01"); //�No me molesta (amenazante) mientras no me dirija la palabra!
	AI_Output (other,self ,"DIA_Addon_Morgan_Francis_15_02"); //�Es el jefe de todo esto?
	AI_Output (self ,other,"DIA_Addon_Morgan_Francis_07_03"); //(risa desagradable) �l CREE que es el jefe.
	AI_Output (self ,other,"DIA_Addon_Morgan_Francis_07_04"); //(recre�ndose) Pero Greg tendr� que volver tarde o temprano y Francis volver� a serrar tablas.
};


// ************************************************************
// ***														***
//							TEACH
// ***														***
// ************************************************************

// ------------------------------------------------------------
// 							Wanna Learn  
// ------------------------------------------------------------
INSTANCE DIA_Addon_Morgan_TRAIN(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 5;
	condition	= DIA_Addon_Morgan_TRAIN_Condition;
	information	= DIA_Addon_Morgan_TRAIN_Info;

	description	= "�Puedes entrenarme tambi�n a m�?";
};                       
FUNC INT DIA_Addon_Morgan_TRAIN_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Morgan_Sleep))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Morgan_TRAIN_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_TRAIN_15_00"); //�Puedes entrenarme a M� tambi�n?
	AI_Output (self ,other,"DIA_Addon_Morgan_TRAIN_07_01"); //Claro, puedo ense�arte a luchar con armas de una mano.
	
	Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);
	
	Morgan_Addon_TeachPlayer = TRUE;
};

// ------------------------------------------------------------
// 		  		Unterrichte mich!
// ------------------------------------------------------------
var int Morgan_merke1h;
var int Morgan_Labercount;
// ------------------------------------------------------------
instance DIA_Addon_Morgan_Teach(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 99;
	condition	= DIA_Addon_Morgan_Teach_Condition;
	information	= DIA_Addon_Morgan_Teach_Info;
	permanent	= TRUE;
	description	= "�Ens��ame!";
};                       
FUNC INT DIA_Addon_Morgan_Teach_Condition()
{
	if (Morgan_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Morgan_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_Teach_15_00"); //�Pues ens��ame!
	
	Morgan_merke1h = other.HitChance[NPC_TALENT_1H];  
	
	Info_ClearChoices 	(DIA_Addon_Morgan_Teach);
	Info_AddChoice 		(DIA_Addon_Morgan_Teach, DIALOG_BACK		,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice		(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice		(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*5)			,DIA_Addon_Morgan_Teach_1H_5);
};
func VOID DIA_Addon_Morgan_Teach_Back()
{
	if (other.HitChance[NPC_TALENT_1H] > Morgan_Merke1h)
	{
		if (Morgan_Labercount == 0)
		{
			AI_Output (self,other,"DIA_Addon_Morgan_CommentFightSkill_07_00"); //Olv�date de esas tonter�as del honor y todo eso. O lo matas o te mata �l a ti.
			Morgan_Labercount = 1;	
		}
		else if (Morgan_Labercount == 1)
		{
			AI_Output (self,other,"DIA_Addon_Morgan_CommentFightSkill_07_01"); //En el futuro, tendr�s que aprender a imprimir m�s fuerza a tus golpes.
			Morgan_Labercount = 2;	
		}
		else if (Morgan_Labercount == 2)
		{
			AI_Output (self,other,"DIA_Addon_Morgan_CommentFightSkill_07_02"); //Ja, ja, ja, al menos ahora sabes empu�ar una espada.
			Morgan_Labercount = 0;	
		};
	}
	else if (other.HitChance[NPC_TALENT_1H] >= 75)
	{
		AI_Output (self ,other,"DIA_Addon_Morgan_Teach_Back_07_00"); //Si quieres seguir mejorando, tendr�s que aprender de otra persona.
	};
	Info_ClearChoices (DIA_Addon_Morgan_Teach);
};
func VOID DIA_Addon_Morgan_Teach_1H_1()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 75);
			
	Info_ClearChoices 	(DIA_Addon_Morgan_Teach);
	Info_AddChoice 		(DIA_Addon_Morgan_Teach,	DIALOG_BACK		,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice		(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice		(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*5)			,DIA_Addon_Morgan_Teach_1H_5);
};

FUNC VOID DIA_Addon_Morgan_Teach_1H_5()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 75);

	Info_ClearChoices 	(DIA_Addon_Morgan_Teach);
	Info_AddChoice 		(DIA_Addon_Morgan_Teach,	DIALOG_BACK		,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice		(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice		(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*5)			,DIA_Addon_Morgan_Teach_1H_5);
};



















