///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fed_EXIT   (C_INFO)
{
	npc         = STRF_1106_Fed;
	nr          = 999;
	condition   = DIA_Fed_EXIT_Condition;
	information = DIA_Fed_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fed_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fed_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fed_HALLO		(C_INFO)
{
	npc		 	 = 	STRF_1106_Fed;
	nr 			 =  2;
	condition	 = 	DIA_Fed_HALLO_Condition;
	information	 = 	DIA_Fed_HALLO_Info;
	permanent 	 =  FALSE;
	important 	 =  TRUE;
};

func int DIA_Fed_HALLO_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_Fajeth_Kill_Snapper != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Fed_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Fed_HALLO_08_00"); //�Qu� quieres de m�? �Yo no voy a ninguna parte!
	AI_Output (other, self, "DIA_Fed_HALLO_15_01"); //Tranquilo, rel�jate. Nadie quiere que vayas a ning�n sitio.
	AI_Output (self, other, "DIA_Fed_HALLO_08_02"); //Gracias a Innos. Ya sabes que, durante los �ltimos d�as, varios hombres han abandonado el campamento y ninguno de ellos ha regresado.
	AI_Output (self, other, "DIA_Fed_HALLO_08_03"); //Fueron devorados todos por chasqueadores. Pero no yo. Yo me quedo aqu� hasta que todo esto haya terminado.
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fed_Snapper	(C_INFO)
{
	npc		 	 = 	STRF_1106_Fed;
	nr 			 =  3;
	condition	 = 	DIA_Fed_Snapper_Condition;
	information	 = 	DIA_Fed_Snapper_Info;
	permanent	 =  FALSE;
	description	 = 	"�Qu� sabes de los chasqueadores?";
};
func int DIA_Fed_Snapper_Condition ()
{	
	if (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Fed_Snapper_Info ()
{
	AI_Output (other, self, "DIA_Fed_Snapper_15_00"); //�Qu� sabes de los chasqueadores?
	AI_Output (self, other, "DIA_Fed_Snapper_08_01"); //Bilgot los vigila por la noche. Unos cuantos est�n en la charca, al pie de la torre oscura.
	AI_Output (self, other, "DIA_Fed_Snapper_08_02"); //Hay otros justo encima de nosotros, en la cima del precipicio. Solo est�n esperando a que estemos todos agotados.
	AI_Output (self, other, "DIA_Fed_Snapper_08_03"); //Nos las arreglamos para quedar atrapados aqu�. Pronto atacar�n el campamento y se dar�n un banquete sangriento...
	AI_Output (other, self, "DIA_Fed_Snapper_15_04"); //Ya veo.
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Fed_Perm	(C_INFO)
{
	npc		 	 = 	STRF_1106_Fed;
	nr 			 =  5;
	condition	 = 	DIA_Fed_Perm_Condition;
	information	 = 	DIA_Fed_Perm_Info;
	permanent	 =  TRUE;
	description	 = 	"�Est�s loco?";
};
func int DIA_Fed_Perm_Condition ()
{	
		return TRUE;
};
func void DIA_Fed_Perm_Info ()
{
	AI_Output (other, self, "DIA_Fed_Perm_15_00"); //�Est�s bien?
	
	if (MIS_Fajeth_Kill_Snapper != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Fed_Perm_08_01"); //Los chasqueadores est�n ah� fuera. �Puedes olerlos...? Yo puedo olerlos...
	}
	else 
	{
		AI_Output (self, other, "DIA_Fed_Perm_08_02"); //Parece que los chasqueadores han retrocedido. Pero eso no significa nada. Volver�n. Ellos, o los lobos, o los lagartos, o los orcos.
		AI_Output (self, other, "DIA_Fed_Perm_08_03"); //Y tarde o temprano nos coger�n y se alimentar�n de nuestros cad�veres...
	};
	AI_StopProcessInfos(self);
	

};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fed_PICKPOCKET (C_INFO)
{
	npc			= STRF_1106_Fed;
	nr			= 900;
	condition	= DIA_Fed_PICKPOCKET_Condition;
	information	= DIA_Fed_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Fed_PICKPOCKET_Condition()
{
	C_Beklauen (32, 8);
};
 
FUNC VOID DIA_Fed_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fed_PICKPOCKET);
	Info_AddChoice		(DIA_Fed_PICKPOCKET, DIALOG_BACK 		,DIA_Fed_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fed_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fed_PICKPOCKET_DoIt);
};

func void DIA_Fed_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fed_PICKPOCKET);
};
	
func void DIA_Fed_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fed_PICKPOCKET);
};




















