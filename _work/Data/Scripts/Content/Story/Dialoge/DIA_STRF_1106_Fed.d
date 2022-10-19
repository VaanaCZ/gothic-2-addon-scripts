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
	AI_Output (self, other, "DIA_Fed_HALLO_08_00"); //Co ode m� chce�? Nikam nejdu!
	AI_Output (other, self, "DIA_Fed_HALLO_15_01"); //Kl�dek, v pohod� - nikdo po tob� nechce, abys n�kam chodil.
	AI_Output (self, other, "DIA_Fed_HALLO_08_02"); //D�ky Innosovi. V�ak v�, b�hem n�kolika posledn�ch dn� opustilo p�r chlap� t�bor - a nikdo z nich se nevr�til.
	AI_Output (self, other, "DIA_Fed_HALLO_08_03"); //V�echny je se�rali ch�apavci. Ale m� ne. Prost� tady z�stanu do t� doby, ne� to skon��.
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
	description	 = 	"Co v� o ch�apavc�ch?";
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
	AI_Output (other, self, "DIA_Fed_Snapper_15_00"); //Co v� o ch�apavc�ch?
	AI_Output (self, other, "DIA_Fed_Snapper_08_01"); //Bilgot je v noci v�d�. N�kolik z nich jich je dole u jez�rka pod tmavou v��.
	AI_Output (self, other, "DIA_Fed_Snapper_08_02"); //Ostatn� jsou p��mo nad n�ma - naho�e na sk�le. Jen �ekaj�, a� se �pln� vy�erp�me.
	AI_Output (self, other, "DIA_Fed_Snapper_08_03"); //Jsme tady v pasti. Brzo napadnou t�bor - a ud�laj� si krvav� hody.
	AI_Output (other, self, "DIA_Fed_Snapper_15_04"); //Aha.
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
	description	 = 	"Copak ses zbl�znil?";
};
func int DIA_Fed_Perm_Condition ()
{	
		return TRUE;
};
func void DIA_Fed_Perm_Info ()
{
	AI_Output (other, self, "DIA_Fed_Perm_15_00"); //Jsi v po��dku?
	
	if (MIS_Fajeth_Kill_Snapper != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Fed_Perm_08_01"); //Venku jsou ch�apavci. C�t� je...? J� je c�t�m...
	}
	else 
	{
		AI_Output (self, other, "DIA_Fed_Perm_08_02"); //Vypad� to, �e se ch�apavci st�hli. Ale to je�t� nic neznamen�. Oni se vr�t� - nebo vlci nebo je�t��i nebo sk�eti.
		AI_Output (self, other, "DIA_Fed_Perm_08_03"); //A d��v nebo pozd�ji n�s dostanou a po�m�knou si na na�ich mrtvol�ch.
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




















