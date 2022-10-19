
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Kurgan_EXIT   (C_INFO)
{
	npc         = DJG_708_Kurgan;
	nr          = 999;
	condition   = DIA_Kurgan_EXIT_Condition;
	information = DIA_Kurgan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kurgan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kurgan_EXIT_Info()
{
	AI_StopProcessInfos (self);
	Npc_SetRefuseTalk (Biff,400);	//Joly: Damit Biff nicht sofort am Anfang Kohle einfordert.
};

//************************************************************************
//	Hello
//************************************************************************
instance DIA_Kurgan_HELLO		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_HELLO_Condition;
	information	= 	DIA_Kurgan_HELLO_Info;

	important	= 	TRUE;
};

func int DIA_Kurgan_HELLO_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_HELLO_Info ()
{
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_00"); //Ehi, tu! La gente come te dovrebbe stare attenta a dove mette i piedi.
	AI_Output			(other,self , "DIA_Kurgan_HELLO_15_01"); //Cosa stai cercando di dirmi?
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_02"); //Voglio dire che l'aria che si respira qua fuori non ti fa bene alla salute. Il posto pullula di orchi e mostri.
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_03"); //Per non parlare dei draghi. Il mio vuole essere un consiglio ben intenzionato.
	B_LogEntry (TOPIC_Dragonhunter,"Un gruppo di cacciatori di draghi mi ha accolto all'ingresso della Valle delle Miniere. Questi tizi sono pesantemente armati, ma ho paura che non faranno una grande impressione ai draghi.");
};

//**************************************************************************
//	Was sonst noch?
//**************************************************************************

instance DIA_Kurgan_ELSE		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_ELSE_Condition;
	information	= 	DIA_Kurgan_ELSE_Info;
	description	= 	"Puoi dirmi qualcosa che io non sappia già?";

};

func int DIA_Kurgan_ELSE_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_ELSE_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_ELSE_15_00"); //Puoi dirmi qualcosa che io non sappia già?
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_01"); //Posso darti un buon consiglio, e per giunta gratis.
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_02"); //Non abbiamo bisogno della gente che sviene alla più piccola scoreggia di drago.
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_03"); //Tornatene a casa. Questo è un lavoro per veri uomini.
	
};

//**************************************************************************
//	Bist du hier der Anführer?
//**************************************************************************

instance DIA_Kurgan_Leader		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_Leader_Condition;
	information	= 	DIA_Kurgan_Leader_Info;
	description	= 	"Sei tu il capo, qui?";

};

func int DIA_Kurgan_Leader_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_Leader_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_Leader_15_00"); //Sei tu il capo, qui?
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_01"); //Ti sembro forse il capo? Certo che no. Non abbiamo bisogno di nessuno che ci dica cosa dobbiamo fare.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_02"); //Quando Silvio ha cercato di atteggiarsi a capo, abbiamo fatto vedere a lui e ai suoi compagni come la pensavamo.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_03"); //C'è stata una rissa. Alla fine se ne sono andati da soli.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_04"); //Spero che Silvio finisca nel pentolone della minestra di qualche orco.
};

//**************************************************************************
//	Wolltet ihr nicht ein paar Drachen töten?
//**************************************************************************

instance DIA_Kurgan_KillDragon		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_KillDragon_Condition;
	information	= 	DIA_Kurgan_KillDragon_Info;
	description	= 	"Così vorresti uccidere draghi?";

};

func int DIA_Kurgan_KillDragon_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kurgan_Leader))
		{
				return TRUE;
		};
};
var int Kurgan_KillDragon_Day;
func void DIA_Kurgan_KillDragon_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_KillDragon_15_00"); //(beffardo) E così tu vorresti andare a caccia di draghi?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_01"); //Ma sentitelo! E così tu sai come uccidere un drago?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_02"); //Credi che quella bestia se ne starà impalata mentre le taglierai la testa?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_03"); //Un'azione del genere va pianificata, e necessita di risolutezza.
	AI_Output			(other,self , "DIA_Kurgan_KillDragon_15_04"); //Capisco. E tu come pensi di farlo?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_05"); //Per prima cosa scopriremo dove possiamo trovare le bestie.
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_06"); //Solo allora studieremo il piano d'attacco migliore.

	
	Kurgan_KillDragon_Day = Wld_GetDay(); 

	Info_AddChoice	(DIA_Kurgan_KillDragon, "Mi piacerebbe guardarti all’opera, ma devo andare.", DIA_Kurgan_KillDragon_weg );
	Info_AddChoice	(DIA_Kurgan_KillDragon, "Come farai a superare gli orchi?"					, DIA_Kurgan_KillDragon_orks );
	Info_AddChoice	(DIA_Kurgan_KillDragon, "Penso che non troverai nemmeno una pecora cieca.", DIA_Kurgan_KillDragon_spott );


};
func void DIA_Kurgan_KillDragon_spott ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_spott_15_00"); //Penso che non troverai nemmeno una pecora cieca.
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_spott_01_01"); //Cosa? Vuoi che ti faccia rimangiare queste parole?
	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};

func void DIA_Kurgan_KillDragon_orks ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_orks_15_00"); //Come farai a superare gli orchi?
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_orks_01_01"); //Ci occuperemo dei dettagli in un secondo momento.

};

func void DIA_Kurgan_KillDragon_weg ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_weg_15_00"); //Mi piacerebbe vederti all’opera, ma devo andare.
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_weg_01_01"); //Tornatene al di là del passo, altrimenti potresti ritrovarti con un paio di arti in meno.

	AI_StopProcessInfos (self);
};
	
///////////////////////////////////////////////////////////////////////
//	Info SEENDRAGON
///////////////////////////////////////////////////////////////////////
instance DIA_Kurgan_SEENDRAGON		(C_INFO)
{
	npc		 = 	DJG_708_Kurgan;
	condition	 = 	DIA_Kurgan_SEENDRAGON_Condition;
	information	 = 	DIA_Kurgan_SEENDRAGON_Info;
	permanent	 = 	TRUE;

	description	 = 	"Hai già visto un drago?";
};

func int DIA_Kurgan_SEENDRAGON_Condition ()
{
	if (Kurgan_KillDragon_Day<=(Wld_GetDay()-2))
		{
				return TRUE;
		};
};

func void DIA_Kurgan_SEENDRAGON_Info ()
{
	AI_Output			(other, self, "DIA_Kurgan_SEENDRAGON_15_00"); //Hai già visto un drago?
	AI_Output			(self, other, "DIA_Kurgan_SEENDRAGON_01_01"); //Non ancora. Ma quelle bestie non possono nascondersi per sempre.
};

//*********************************************************************
//	AllDragonsDead 
//*********************************************************************
INSTANCE DIA_Kurgan_AllDragonsDead   (C_INFO)
{
	npc         = DJG_708_Kurgan;
	nr          = 5;
	condition   = DIA_Kurgan_AllDragonsDead_Condition;
	information = DIA_Kurgan_AllDragonsDead_Info;
	permanent   = FALSE;
	description	= "I draghi sono morti.";
				
};

FUNC INT DIA_Kurgan_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Kurgan_AllDragonsDead_Info()
{
	AI_Output	(other,self ,"DIA_Kurgan_AllDragonsDead_15_00"); //I draghi sono morti.
	AI_Output 	(self ,other,"DIA_Kurgan_AllDragonsDead_01_01"); //Ah, e chi pensi che li abbia uccisi? I paladini?
	AI_Output 	(other,self ,"DIA_Kurgan_AllDragonsDead_15_02"); //Li ho uccisi io.
	AI_Output 	(self ,other,"DIA_Kurgan_AllDragonsDead_01_03"); //(ride) Ah. Ma non farmi ridere. Smettila di raccontare fesserie.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Kurgan_PICKPOCKET (C_INFO)
{
	npc			= DJG_708_Kurgan;
	nr			= 900;
	condition	= DIA_Kurgan_PICKPOCKET_Condition;
	information	= DIA_Kurgan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Kurgan_PICKPOCKET_Condition()
{
	C_Beklauen (34, 120);
};
 
FUNC VOID DIA_Kurgan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kurgan_PICKPOCKET);
	Info_AddChoice		(DIA_Kurgan_PICKPOCKET, DIALOG_BACK 		,DIA_Kurgan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kurgan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kurgan_PICKPOCKET_DoIt);
};

func void DIA_Kurgan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kurgan_PICKPOCKET);
};
	
func void DIA_Kurgan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kurgan_PICKPOCKET);
};




