//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Senyan_EXIT   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 999;
	condition   = DIA_Addon_Senyan_EXIT_Condition;
	information = DIA_Addon_Senyan_EXIT_Info;
	permanent   = TRUE;
	description = "Nos vemos�";
};
FUNC INT DIA_Addon_Senyan_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Senyan_EXIT_Info()
{
	if (Senyan_Erpressung == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Senyan_EXIT_12_00");//Ya sabes lo que tienes que hacer
	};
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Senyan_PICKPOCKET (C_INFO)
{
	npc			= BDT_1084_Addon_Senyan;
	nr			= 900;
	condition	= DIA_Addon_Senyan_PICKPOCKET_Condition;
	information	= DIA_Addon_Senyan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Senyan_PICKPOCKET_Condition()
{
	C_Beklauen (45, 88);
};
 
FUNC VOID DIA_Addon_Senyan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Senyan_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Senyan_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Senyan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Senyan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Senyan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Senyan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Senyan_PICKPOCKET);
};
	
func void DIA_Addon_Senyan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Senyan_PICKPOCKET);
};
//----------------------------------------------------------------------
FUNC VOID B_Senyan_Attack()
{
	AI_Output (self, other, "DIA_Addon_Senyan_Attack_12_00");//(con sorna) �Entonces para qu� te necesito, memo?
	AI_Output (self, other, "DIA_Addon_Senyan_Attack_12_01");//(grita) Eh, �mirad a qui�n tenemos aqu�!
	
	Senyan_Called = TRUE;	
	Senyan_Erpressung = LOG_OBSOLETE;
	B_CheckLog();
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
}; 
//----------------------------------------------------------------------
FUNC VOID B_Senyan_Erpressung()
{
	AI_Output (other, self, "DIA_Addon_Senyan_Erpressung_15_00");//�Cu�nto quieres?
	AI_Output (self, other, "DIA_Addon_Senyan_Erpressung_12_01");//(haci�ndose el dolido) Oh, no, por favor, no quiero chantajearte tu oro. Nunca se me ocurrir�a.
	AI_Output (other, self, "DIA_Addon_Senyan_Erpressung_15_02");//�Entonces qu� es lo que quieres?
	AI_Output (self, other, "DIA_Addon_Senyan_Erpressung_12_03");//Hace poco alguien intent� quitarse de en medio a Esteban, pero �l consigui� refugiarse con sus guardaespaldas.
	AI_Output (self, other, "DIA_Addon_Senyan_Erpressung_12_04");//Visita a Esteban y habla con �l. Luego volveremos a hablar.
	
	AI_StopProcessInfos (self);
	Log_CreateTopic (Topic_Addon_Senyan,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Senyan,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Senyan,"Senyan me ha reconocido. Sabe qui�n soy y quiere aprovecharse para sus propios planes. Tiene algo en mente y quiere que hable antes con Esteban.");
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_1084_Senyan_Hi   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 1;
	condition   = DIA_Addon_Senyan_Hi_Condition;
	information = DIA_Addon_Senyan_Hi_Info;
	permanent   = FALSE;
	Important 	= TRUE;
};
FUNC INT DIA_Addon_Senyan_Hi_Condition()
{	
	return TRUE;
};
//--------------------
var int Senyan_Msg;
var int Senyan_Bad;
var int Senyan_Good;
//--------------------
FUNC VOID DIA_Addon_Senyan_Hi_Info()
{	
	
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_12_00");//�Ah! �A qui�n tenemos aqu�?
	B_UseFakeScroll();
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_12_01");//Vaya, vaya. Aqu� est�s. Te traigo buenas y malas noticias.
	
	Info_ClearChoices (DIA_Addon_BDT_1084_Senyan_Hi);
	Info_AddChoice (DIA_Addon_BDT_1084_Senyan_Hi,"Primero las buenas.",DIA_Addon_BDT_1084_Senyan_Hi_good);
	Info_AddChoice (DIA_Addon_BDT_1084_Senyan_Hi,"Primero las malas.",DIA_Addon_BDT_1084_Senyan_Hi_bad);
};
FUNC VOID DIA_Addon_BDT_1084_Senyan_Hi_good()
{
	if (Senyan_Msg == FALSE)
	{
		AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Hi_good_15_00");//Primero las buenas.
		Senyan_Msg = TRUE;
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Hi_good_15_01");//�Y cu�les son las buenas?
	};
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_good_12_02");//Bien, pues no s� c�mo, te has hecho un par de enemigos muy poderosos.
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_good_12_03");//Tienes suerte de que te haya reconocido yo, y no otra persona.
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_good_12_04");//Porque yo soy comprensivo y sociable.
	
	
	Senyan_Good = TRUE;
	
	Info_ClearChoices (DIA_Addon_BDT_1084_Senyan_Hi);
	
	if (Senyan_Bad == TRUE)
	{
		B_Senyan_Erpressung();
	}
	else 
	{
		Info_AddChoice (DIA_Addon_BDT_1084_Senyan_Hi,"�Y cu�les son las malas?",DIA_Addon_BDT_1084_Senyan_Hi_bad);
	};
};
FUNC VOID DIA_Addon_BDT_1084_Senyan_Hi_bad()
{
	if (Senyan_Msg == FALSE)
	{
		AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Hi_bad_15_00");//Primero las malas.
		Senyan_Msg = TRUE;
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Hi_bad_15_01");//�Y cu�les son las malas?
	};
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_02");//Raven te anda buscando. Y sus guardias tambi�n. En realidad, todos los bandidos te buscan
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_03");//Y si te encuentran, te matar�n.
	AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Hi_bad_15_04");//Mucha gente ya lo ha intentado.
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_05");//Entonces eres tan h�bil luchando como astuto. Venir al campamento con una armadura nuestra es como
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_06");//�ponerse piel de oveja y meterse entre lobos. Tu vida pende de un hilo, hijo del peligro.
	
	Senyan_Bad = TRUE;
	
	Info_ClearChoices (DIA_Addon_BDT_1084_Senyan_Hi);
	
	if (Senyan_Good == TRUE)
	{
		B_Senyan_Erpressung();
	}
	else 
	{
		Info_AddChoice (DIA_Addon_BDT_1084_Senyan_Hi,"�Y cu�les son las buenas?",DIA_Addon_BDT_1084_Senyan_Hi_good);
	};
};
//---------------------------------------------------------------------
//	Info unterwegs
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Senyan_unterwegs   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 99;
	condition   = DIA_Addon_Senyan_unterwegs_Condition;
	information = DIA_Addon_Senyan_unterwegs_Info;
	permanent   = TRUE;
	description	= "Sobre Esteban�";
};
FUNC INT DIA_Addon_Senyan_unterwegs_Condition()
{	
	if (MIS_Judas != LOG_RUNNING)
	&& Npc_KnowsInfo (other,DIA_Addon_BDT_1084_Senyan_Hi)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Senyan_unterwegs_Info()
{
	AI_Output (other, self, "DIA_Addon_Senyan_unterwegs_15_00");//Sobre Esteban
	AI_Output (self, other, "DIA_Addon_Senyan_unterwegs_12_01");//�Ya has hablado con �l?
	AI_Output (other, self, "DIA_Addon_Senyan_unterwegs_15_02");//A�n no.
	AI_Output (self, other, "DIA_Addon_Senyan_unterwegs_12_03");//Pues deber�as hacerlo pronto.
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Senyan_Attentat   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 2;
	condition   = DIA_Addon_Senyan_Attentat_Condition;
	information = DIA_Addon_Senyan_Attentat_Info;
	permanent   = FALSE;
	description	= "Ya he hablado con Esteban.";
};
FUNC INT DIA_Addon_Senyan_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	&& Npc_KnowsInfo (other,DIA_Addon_BDT_1084_Senyan_Hi)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Senyan_Attentat_Info()
{
	AI_Output (other, self, "DIA_Addon_Senyan_Attentat_15_00");//Ya he hablado con Esteban.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_01");//�Y te ha dicho algo sobre el ataque?
	AI_Output (other, self, "DIA_Addon_Senyan_Attentat_15_02");//Me ha ordenado averiguar qui�n envi� al asesino. �Sabes algo al respecto?
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_03");//No m�s que t�. Tambi�n ando tras el tipo que lo organiz� todo. Y ahora viene la parte interesante.
	AI_Output (other, self, "DIA_Addon_Senyan_Attentat_15_04");//Te escucho.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_05");//Quiero que hagas bien tu trabajo. Tienes que encontrar al traidor.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_06");//(fr�o)Y cuando lo hayas encontrado, m�tale en mi nombre.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_07");//Entonces me quedar� la recompensa.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_08");//Tengo un cartel donde ofrecen dinero por tu cabeza, no lo olvides. Haz tu trabajo y hazlo bien. Si no, ya sabes lo que pasar�.

	Info_ClearChoices (DIA_Addon_Senyan_Attentat);
	Info_AddChoice (DIA_Addon_Senyan_Attentat,"Supongo que no me queda otra�",DIA_Addon_Senyan_Attentat_JA);
	Info_AddChoice (DIA_Addon_Senyan_Attentat,"�Ni hablar!",DIA_Addon_Senyan_Attentat_NO);
};
FUNC VOID DIA_Addon_Senyan_Attentat_NO()
{
	AI_Output (other, self, "DIA_Addon_Senyan_Attentat_NO_15_00");//�Olv�dalo!

	B_Senyan_Attack();
	Info_ClearChoices (DIA_Addon_Senyan_Attentat);
};
FUNC VOID DIA_Addon_Senyan_Attentat_JA()
{
	AI_Output (other, self, "DIA_Addon_Senyan_Attentat_JA_15_00");//No tengo alternativa
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_JA_12_01");//Sab�a que pod�amos entendernos.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_JA_12_02");//(brusco) Cuando averig�es de qui�n se trata, iremos los dos a por �l. �Y ahora largo!
	
	Senyan_Erpressung = LOG_RUNNING;
	Info_ClearChoices (DIA_Addon_Senyan_Attentat);
	
	B_LogEntry (Topic_Addon_Senyan,"Senyan quiere que encuentre al responsable y acabe con �l. Luego �l se embolsar� la recompensa.");
};

//----------------------------------------------------------------------
//	Anders �berlegt
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Senyan_ChangePlan   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 3;
	condition   = DIA_Addon_Senyan_ChangePlan_Condition;
	information = DIA_Addon_Senyan_ChangePlan_Info;
	permanent   = FALSE;
	description = "He cambiado de idea. A partir de ahora, nada de trabajar juntos.";
};
FUNC INT DIA_Addon_Senyan_ChangePlan_Condition()
{	
	if (Senyan_Erpressung == LOG_RUNNING)
	&& (Snaf_Tip_Senyan == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Senyan_ChangePlan_Info()
{	
	AI_Output (other, self, "DIA_Addon_Senyan_ChangePlan_15_00"); //He cambiado de idea. �Ya no quiero trabajar contigo!
	B_Senyan_Attack(); 
			
	AI_StopProcessInfos (self);
};		

//----------------------------------------------------------------------
//	Erpressung Found Fisk
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_1084_Senyan_Found   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 3;
	condition   = DIA_Addon_Senyan_Found_Condition;
	information = DIA_Addon_Senyan_Found_Info;
	permanent   = FALSE;
	description = "He descubierto al traidor. Es Fisk.";
};
FUNC INT DIA_Addon_Senyan_Found_Condition()
{	
	if (Senyan_Erpressung == LOG_RUNNING)
	&& (MIS_Judas == LOG_SUCCESS)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Senyan_Found_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Found_15_00");//He descubierto al traidor. Es Fisk.
	B_Senyan_Attack(); 
};		
//----------------------------------------------------------------------
//	Erpressung derbe
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_1084_Senyan_derbe   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 1;
	condition   = DIA_Addon_Senyan_derbe_Condition;
	information = DIA_Addon_Senyan_derbe_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Senyan_derbe_Condition()
{	
	if (Senyan_Erpressung == LOG_RUNNING)
	&& (MIS_Judas == LOG_SUCCESS)
	&& (Npc_IsDead (Fisk)
	|| Npc_IsDead (Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Senyan_derbe_Info()
{	
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_derbe_12_00");//(furioso) No has cumplido nuestro acuerdo.
	
	B_Senyan_Attack();		
};


	


