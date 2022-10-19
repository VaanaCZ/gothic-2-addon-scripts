// ************************************************
// 						EXIT
// ************************************************
INSTANCE DIA_Boltan_EXIT   (C_INFO)
{
	npc         = Mil_313_Boltan;
	nr          = 999;
	condition   = DIA_Boltan_EXIT_Condition;
	information = DIA_Boltan_EXIT_Info;
	permanent   = TRUE;
	description = "Stavo per andarmene.";
};

FUNC INT DIA_Boltan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Boltan_EXIT_Info()
{
	//AI_Output (other, self, "DIA_Boltan_Add_15_15"); //Ich wollte gerade wieder gehen.
	AI_StopProcessInfos (self);
};

// ************************************************
// 						Hallo
// ************************************************
instance DIA_Boltan_HALLO		(C_INFO)
{
	npc			= Mil_313_Boltan;
	nr 			= 1;
	condition	= DIA_Boltan_HALLO_Condition;
	information = DIA_Boltan_HALLO_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Boltan_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Boltan_HALLO_Info ()
{
	AI_Output (self ,other, "DIA_Boltan_Add_05_00"); //Cosa ci fai qui?
};

// ************************************************
// 						Hallo
// ************************************************
instance DIA_Boltan_ToConvicts		(C_INFO)
{
	npc			= Mil_313_Boltan;
	nr 			= 2;
	condition	= DIA_Boltan_ToConvicts_Condition;
	information = DIA_Boltan_ToConvicts_Info;
	permanent 	= TRUE;
	description = "Voglio vedere i prigionieri.";
};

func int DIA_Boltan_ToConvicts_Condition ()
{
	return TRUE;
};

func void DIA_Boltan_ToConvicts_Info ()
{
	AI_Output (other, self, "DIA_Boltan_Add_15_01"); //Voglio vedere i prigionieri.
	
	
	if (Kapitel == 3) 
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		if (other.guild == GIL_SLD)
		{
			AI_Output (self ,other, "DIA_Boltan_Add_05_07"); //Sì, entra e vai a salutare il tuo amico.
		}
		else
		{
			AI_Output (self ,other, "DIA_Boltan_Add_05_06"); //Abbiamo rinchiuso quel maiale che ha ucciso Lothar il paladino.
		};
	}
	else if (Canthar_Ausgeliefert == FALSE)
	&& (Sarah_Ausgeliefert == FALSE)
	&& (Rengaru_Ausgeliefert == FALSE)
	&& (Nagur_Ausgeliefert == FALSE)
	{
		AI_Output (self ,other, "DIA_Boltan_Add_05_02"); //Al momento tutte le celle sono vuote.
	}
	else
	{
		if (other.guild == GIL_MIL)
		{
			AI_Output (self ,other, "DIA_Boltan_Add_05_04"); //D’accordo, collega.
		}
		else if (other.guild == GIL_PAL) || (other.guild == GIL_KDF)
		{
			AI_Output (self ,other, "DIA_Boltan_Add_05_05"); //Naturalmente.
		}
		else
		{
			AI_Output (self ,other, "DIA_Boltan_Add_05_03"); //Entra, ma non trattenerti troppo a lungo, capito?
		};
	};
};		
		
// ************************************************
// 					HalloBennet
// ************************************************
instance DIA_Boltan_HalloBennet (C_INFO)
{
	npc			= Mil_313_Boltan;
	nr 			= 1;
	condition	= DIA_Boltan_HalloBennet_Condition;
	information = DIA_Boltan_HalloBennet_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Boltan_HalloBennet_Condition ()
{
	if (Kapitel == 3) 
	&& (MIS_RescueBennet != LOG_SUCCESS)
	&& (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};

func void DIA_Boltan_HalloBennet_Info ()
{
	AI_Output (self ,other, "DIA_Boltan_Add_05_08"); //Non sei venuto per far evadere il tuo amico, vero?
	AI_Output (self ,other, "DIA_Boltan_Add_05_09"); //Scordatelo! Non appena suonerò l'allarme, i miei uomini saranno qui in un attimo!
	AI_Output (self ,other, "DIA_Boltan_Add_05_10"); //E a quel punto faremo uno spezzatino di mercenario! (risata sguaiata)
};		
	
// ************************************************
// 					HalloCanthar
// ************************************************
instance DIA_Boltan_HalloCanthar (C_INFO)
{
	npc			= Mil_313_Boltan;
	nr 			= 1;
	condition	= DIA_Boltan_HalloCanthar_Condition;
	information = DIA_Boltan_HalloCanthar_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Boltan_HalloCanthar_Condition ()
{
	if ( (Kapitel != 3) || ( (Kapitel == 3) && ( (MIS_RescueBennet == LOG_SUCCESS) || (other.guild != GIL_SLD) ) ) )
	&& (Canthar_WiederRaus == TRUE)
	&& (Canthar_Ausgeliefert == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Boltan_HalloCanthar_Info ()
{
	AI_Output (self ,other, "DIA_Boltan_Add_05_11"); //Ehi, tu sei quello che ha accusato Canthar il mercante.
	AI_Output (self ,other, "DIA_Boltan_Add_05_12"); //Molta gente è venuta qui per garantire per lui. Tutte persone rispettabili.
	AI_Output (self ,other, "DIA_Boltan_Add_05_13"); //Credo che la situazione sia stata fraintesa. Sono cose che succedono.
	AI_Output (self ,other, "DIA_Boltan_Add_05_14"); //In futuro dovresti fare più attenzione a chi mandi in prigione.
};		















