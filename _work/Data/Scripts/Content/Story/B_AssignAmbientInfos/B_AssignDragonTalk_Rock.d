// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Rock_Exit(C_INFO)
{
	
	nr			= 999;
	condition	= DIA_Dragon_Rock_Exit_Condition;
	information	= DIA_Dragon_Rock_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Rock_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Rock_Exit_Info()
{	
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 

	AI_Output			(self, other, "DIA_Dragon_Rock_Exit_20_00"); //Basta con le parole. Il tuo potere temporaneo si è esaurito. L'Occhio ha perso la sua forza. Preparati a morire.

	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Rock_Hello(C_INFO)
{
	
	nr			= 1;
	condition	= DIA_Dragon_Rock_Hello_Condition;
	information	= DIA_Dragon_Rock_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Rock_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};	
};

FUNC VOID DIA_Dragon_Rock_Hello_Info()
{	
	AI_Output			(self, other, "DIA_Dragon_Rock_Hello_20_00"); //Ecco un'altra creatura presuntuosa che osa arrampicarsi fino a me. Voi piccoli umani siete così coraggiosi e, al tempo stesso, così fragili.
	if (Mis_KilledDragons == 0)
	{
		AI_Output			(other, self, "DIA_Dragon_Rock_Hello_15_01"); //Ehi, ma tu sai parlare.
	};
	AI_Output (self, other, "DIA_Dragon_Rock_Hello_20_02"); //Ti strapperò le budella e le darò in pasto ai topi.
	AI_Output (other, self, "DIA_Dragon_Rock_Add_15_00"); //Non avere troppa fretta. Ho con me l'Occhio di Innos. Tu mi obbedirai e risponderai alle mie domande.
	AI_Output (self, other, "DIA_Dragon_Rock_Hello_20_04"); //(ruggisce) Argh. Fammi le tue domande.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_WERBISTDU		(C_INFO)
{
	nr		 = 	6;
	condition	 = 	DIA_Dragon_Rock_WERBISTDU_Condition;
	information	 = 	DIA_Dragon_Rock_WERBISTDU_Info;

	description	 = 	"Chi sei?";
};

func int DIA_Dragon_Rock_WERBISTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Rock_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Rock_WERBISTDU_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Rock_WERBISTDU_15_00"); //Chi sei?
	AI_Output			(self, other, "DIA_Dragon_Rock_WERBISTDU_20_01"); //Il mio nome è Pedrakhan e ti scuoierò vivo lentamente quando ti metterò le mani addosso.

};


///////////////////////////////////////////////////////////////////////
//	Info Hierarchie
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_HIERARCHIE		(C_INFO)
{
	nr		 = 	7;
	condition	 = 	DIA_Dragon_Rock_HIERARCHIE_Condition;
	information	 = 	DIA_Dragon_Rock_HIERARCHIE_Info;

	description	 = 	"Chi è il drago più forte tra voi?";
};

func int DIA_Dragon_Rock_HIERARCHIE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Rock_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Rock_HIERARCHIE_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Rock_HIERARCHIE_15_00"); //Chi è il drago più forte tra voi?
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_01"); //La nostra forza deriva dagli elementi di questo mondo. La loro gerarchia è chiara e semplice.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_02"); //La soffice terra conferisce la vita a tutte le creature baciate dal sole, eppure si aprirà e ti inghiottirà completamente se ti avvicini troppo a essa.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_03"); //La roccia, che preferirebbe spaccarsi piuttosto che arrendersi, troneggia con orgoglio e seppellisce gli sbadati sotto di essa, eppure fornisce il miglior riparo dalle maree.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_04"); //La scintilla della vita vive nei fuochi profondi di questo mondo, eppure il fuoco brucia ogni cosa in un attimo, lasciando solo cenere.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_05"); //Tutti i nostri elementi sono in grado di preservare e distruggere, ma solo nell'acqua diventata dura e solida come la roccia ogni cosa verrà trasformata in una eterna colonna di sale dove la vita è a mala pena possibile.

};


//**********************************************************************************
//		B_AssignDragonTalk_Rock
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Rock (var c_NPC slf)
{
	DIA_Dragon_Rock_EXIT.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_Hello.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_WERBISTDU.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_HIERARCHIE.npc				= Hlp_GetInstanceID(slf);
	
	//Die Drachenfragen
	B_AssignDragonTalk_Main (slf);
		
};






