
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Isgaroth_EXIT   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 999;
	condition   = DIA_Isgaroth_EXIT_Condition;
	information = DIA_Isgaroth_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Isgaroth_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Isgaroth_EXIT_Info()
{
	AI_Output	(self ,other,"DIA_Isgaroth_EXIT_01_00"); //Que Innos te proteja en todo momento.
	AI_StopProcessInfos (self);
};
//****************************************************************************
//	Begrüssung
//****************************************************************************

INSTANCE DIA_Isgaroth_Hello   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 2;
	condition   = DIA_Isgaroth_Hello_Condition;
	information = DIA_Isgaroth_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Isgaroth_Hello_Condition()
{
	if Npc_IsInState (self,ZS_Talk)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Isgaroth_Hello_Info()
{
	AI_Output (self ,other,"DIA_Isgaroth_Hello_01_00"); //Que Innos te acompañe. ¿En qué puedo ayudarte, peregrino?
}; 
//****************************************************************************
//	Segen
//****************************************************************************
INSTANCE DIA_Isgaroth_Segen   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 10;
	condition   = DIA_Isgaroth_Segen_Condition;
	information = DIA_Isgaroth_Segen_Info;
	permanent   = TRUE;
	description	= "¡Bendíceme!";
};
FUNC INT DIA_Isgaroth_Segen_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Isgaroth_Segen_Info()
{
	AI_Output (other ,self,"DIA_Isgaroth_Segen_15_00"); //¡Bendíceme!
	AI_Output (self ,other,"DIA_Isgaroth_Segen_01_01"); //Te bendigo en el nombre de Innos. Que el fuego del Señor arda en tu corazón y te dé fuerzas para actuar según su justicia.
	
	Isgaroth_Segen = TRUE;
}; 
//********************************************************************************
//	Sergio schickt mich  (Wolf Mission)
//********************************************************************************
INSTANCE DIA_Isgaroth_Wolf   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 2;
	condition   = DIA_Isgaroth_Wolf_Condition;
	information = DIA_Isgaroth_Wolf_Info;
	permanent   = FALSE;
	description	= "Me envía Sergio...";
};
FUNC INT DIA_Isgaroth_Wolf_Condition()
{	
	if (MIS_KlosterArbeit == LOG_RUNNING)
	&& (Sergio_Sends == TRUE) 
	&& (Kapitel == 1)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Isgaroth_Wolf_Info()
{
	AI_Output (other,self ,"DIA_Isgaroth_Wolf_15_00"); //Me manda Sergio. Me he hecho cargo de su misión. ¿En qué consiste?
	AI_Output (self ,other,"DIA_Isgaroth_Wolf_01_01"); //Últimamente se ha visto a un lobo oscuro rondando por la zona. Encuéntralo y mátalo.

	MIS_IsgarothWolf = LOG_RUNNING;
	B_LogEntry (Topic_IsgarothWolf,"Hay un lobo oscuro merodeando por el altar. Debería encontrarlo y matarlo.");
	
};
//********************************************************************************
// Wolf tot
//********************************************************************************
INSTANCE DIA_Isgaroth_tot   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 2;
	condition   = DIA_Isgaroth_tot_Condition;
	information = DIA_Isgaroth_tot_Info;
	permanent   = TRUE;
	description	= "He matado al lobo.";
};
FUNC INT DIA_Isgaroth_tot_Condition()
{	
	Wolfi = Hlp_GetNpc (BlackWolf);
	
	if (MIS_IsgarothWolf == LOG_RUNNING)
	&& Npc_IsDead (Wolfi)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Isgaroth_tot_Info()
{
	AI_Output (other,self ,"DIA_Isgaroth_tot_15_00"); //He matado al lobo.
	AI_Output (self ,other,"DIA_Isgaroth_tot_01_01"); //Buen trabajo, novicio. Eres un hombre valiente. Ahora vuelve al monasterio y ocúpate de tus obligaciones.
	
	MIS_IsgarothWolf = LOG_SUCCESS;
	B_GivePlayerXP (XP_IsgarothWolf);
	AI_StopProcessInfos (self);
	
};
//********************************************************************************
//	Was machst Du hier
//********************************************************************************

INSTANCE DIA_Isgaroth_Job   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 4;
	condition   = DIA_Isgaroth_Job_Condition;
	information = DIA_Isgaroth_Job_Info;
	permanent   = FALSE;
	description	= "¿Qué estás haciendo aquí?";
};
FUNC INT DIA_Isgaroth_Job_Condition()
{
	if (hero.guild != GIL_KDF)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Isgaroth_Job_Info()
{
	AI_Output (other,self ,"DIA_Isgaroth_Job_15_00"); //¿Qué haces aquí?
	AI_Output (self ,other,"DIA_Isgaroth_Job_01_01"); //Soy un mago del fuego, un sacerdote de nuestro dios Innos.
	AI_Output (self ,other,"DIA_Isgaroth_Job_01_02"); //Este santuario está consagrado a él, el dios supremo, creador del fuego y señor de la justicia.
	AI_Output (self ,other,"DIA_Isgaroth_Job_01_03"); //La gente viene a verme para rezarle a Innos y recibir mi bendición.
	AI_Output (self ,other,"DIA_Isgaroth_Job_01_04"); //Y a cambio de un modesto donativo, te puedo proporcionar muchas cosas útiles.
	
	Log_CreateTopic (Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry (Topic_KlosterTrader,"El maestro Isgaroth trafica con objetos mágicos, en el altar que está frente al monasterio.");
};
//****************************************************************************
//	Trade
//****************************************************************************
INSTANCE DIA_Isgaroth_Trade   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 99;
	condition   = DIA_Isgaroth_Trade_Condition;
	information = DIA_Isgaroth_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description	= "Enséñame tu mercancía.";
};
FUNC INT DIA_Isgaroth_Trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Isgaroth_Job)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Isgaroth_Trade_Info()
{
	B_GiveTradeInv (self);
	AI_Output (other ,self,"DIA_Isgaroth_Trade_15_00"); //Muéstrame tu mercancía.
};
//********************************************************************************
//	Kloster
//********************************************************************************
INSTANCE DIA_Isgaroth_Kloster   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 3;
	condition   = DIA_Isgaroth_Kloster_Condition;
	information = DIA_Isgaroth_Kloster_Info;
	permanent   = FALSE;
	description	= "¿Adónde me lleva este sendero?";
};
FUNC INT DIA_Isgaroth_Kloster_Condition()
{	
	if (other.guild != GIL_NOV)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Isgaroth_Kloster_Info()
{
	AI_Output (other,self ,"DIA_Isgaroth_Kloster_15_00"); //¿Adónde me lleva este sendero?
	AI_Output (self ,other,"DIA_Isgaroth_Kloster_01_01"); //El sendero lleva al monasterio de los magos del fuego. No obstante, en él solo pueden entrar los discípulos de Innos.
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self ,other,"DIA_Isgaroth_Kloster_01_02"); //Y si quieres ser aceptado como novicio en el monasterio, debes llevar una oveja y...
		B_Say_Gold (self, other,Summe_Kloster);
		
		Log_CreateTopic (Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus (Topic_Kloster,LOG_RUNNING);
		B_LogEntry (Topic_Kloster,"Para convertirme en un novicio del monasterio de Innos necesito una oveja y 1.000 monedas de oro.");
	}
	else 
	{
		AI_Output (self ,other,"DIA_Isgaroth_Kloster_01_03"); //Como ya has decidido ingresar en otro grupo, te prohibirán la entrada.
	};
};



//******************************************************************************************
//	Vatras Auftrag
//******************************************************************************************
INSTANCE DIA_Isgaroth_Vatras   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 3;
	condition   = DIA_Isgaroth_Vatras_Condition;
	information = DIA_Isgaroth_Vatras_Info;
	permanent   = TRUE;
	description	= "Traigo un mensaje de Vatras.";
};
FUNC INT DIA_Isgaroth_Vatras_Condition()
{
	if (MIS_Vatras_Message == LOG_RUNNING)
	&& ((Npc_HasItems (other,ItWr_VatrasMessage) == 1)
	||  (Npc_HasItems (other,ItWr_VatrasMessage_open) == 1))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Isgaroth_Vatras_Info()
{
	AI_Output (other,self ,"DIA_ISgaroth_Vatras_15_00"); //Traigo un mensaje de Vatras.
	AI_Output (self ,other,"DIA_Isgaroth_Vatras_01_01"); //¿Cuál es el mensaje?
	AI_Output (other,self ,"DIA_Isgaroth_Vatras_15_02"); //Es una carta. Ten.
	
	if (Npc_HasItems (other,ItWr_VatrasMessage) == 1)
	{
		if B_GiveInvItems (other,self ,ItWr_VatrasMessage,1)
		{
			Npc_RemoveInvItems (self,ItWr_VatrasMessage,1); 
		};
		B_UseFakeScroll();
	
		AI_Output (self ,other,"DIA_Isgaroth_Vatras_01_03"); //Bien. Dile a Vatras que he recibido el mensaje.
		AI_Output (self ,other,"DIA_Isgaroth_Vatras_01_04"); //Toma estas pociones como recompensa por tus servicios. Seguro que te son útiles.
		
		CreateInvItems (self, ItPo_Health_02,2);
		B_GiveInvItems (self,other,ItPo_Health_02,2);
		
		B_GivePlayerXP ((XP_Ambient)*2);
		
	}
	else if (Npc_HasItems (other,ItWr_VatrasMessage_open) == 1)
	{
		if B_GiveInvItems (other,self ,ItWr_VatrasMessage_open,1)
		{
			Npc_RemoveInvItems (self,ItWr_VatrasMessage_open,1); 
		};
		B_UseFakeScroll ();
	
		AI_Output (self ,other,"DIA_Isgaroth_Vatras_01_05"); //El sello está roto. ¿En qué estabas pensando, necio?
		AI_Output (self ,other,"DIA_Isgaroth_Vatras_01_06"); //Ve a decirle a Vatras que he recibido su mensaje.
		AI_StopProcessInfos (self);
	};	
	Vatras_Return = TRUE;
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Isgaroth_PICKPOCKET (C_INFO)
{
	npc			= KDF_509_Isgaroth;
	nr			= 900;
	condition	= DIA_Isgaroth_PICKPOCKET_Condition;
	information	= DIA_Isgaroth_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Isgaroth_PICKPOCKET_Condition()
{
	C_Beklauen (48, 50);
};
 
FUNC VOID DIA_Isgaroth_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Isgaroth_PICKPOCKET);
	Info_AddChoice		(DIA_Isgaroth_PICKPOCKET, DIALOG_BACK 		,DIA_Isgaroth_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Isgaroth_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Isgaroth_PICKPOCKET_DoIt);
};

func void DIA_Isgaroth_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Isgaroth_PICKPOCKET);
};
	
func void DIA_Isgaroth_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Isgaroth_PICKPOCKET);
};


