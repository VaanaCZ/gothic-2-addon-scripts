///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Valentino_EXIT   (C_INFO)
{
	npc         = VLK_421_Valentino;
	nr          = 999;
	condition   = DIA_Valentino_EXIT_Condition;
	information = DIA_Valentino_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Valentino_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Valentino_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Valentino_HALLO		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 1;
	condition	= DIA_Valentino_HALLO_Condition;
	information	= DIA_Valentino_HALLO_Info;
	permanent 	= FALSE;
	description	= "Bene, cosa abbiamo qui?";
};

func int DIA_Valentino_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Valentino_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Valentino_HALLO_15_00"); //Bene, cosa abbiamo qui?
	//AI_Output (other, self, "DIA_Valentino_Add_15_00"); //Hey, wer bist du denn?
	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_01"); //Il mio nome è Valentino. Sto cercando di non profanare con il lavoro questa giornata che Innos mi ha dato.
		AI_Output			(other, self, "DIA_Valentino_HALLO_15_02"); //Attento a quello che dici.
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_03"); //Oh, perdonami, non volevo offendere il nostro Signore. Perdonami, sire.
	}
	else
	{
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_04"); //Non conosci le buone maniere? È disgustoso!
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_05"); //Sempre questa sporca canaglia. Non dovresti essere al lavoro?
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_06"); //D'altronde immagino che nessuno sentirebbe la mancanza di un rifiuto umano come te, eh?
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_07"); //Se avessi tanto oro come me, non dovresti lavorare. Ma non sarai mai così ricco.
		AI_Output			(other, self, "DIA_Valentino_HALLO_15_08"); //Credo che mi divertirò molto con te.
	};
};

// ********************************************************
// 						WhoAgain
// ********************************************************

instance DIA_Valentino_WhoAgain		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 2;
	condition	= DIA_Valentino_WhoAgain_Condition;
	information	= DIA_Valentino_WhoAgain_Info;
	permanent 	= FALSE;
	description	= "Ti ho chiesto chi sei!";
};

func int DIA_Valentino_WhoAgain_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Valentino_HALLO))
	&& (other.guild != GIL_KDF)
	&& (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Valentino_WhoAgain_Info ()
{
	AI_Output (other, self, "DIA_Valentino_Add_15_01"); //Ti ho chiesto chi sei!
	//AI_Output			(other, self, "DIA_Valentino_HALLO_wasmachstdu_15_00"); //Was macht jemand wie du in der Stadt?
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_01"); //Sono Valentino il bello. Buon vivente e uomo delle donne.
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_02"); //Povero nel piacere, ricco nella saggezza e nell'oro e le donne non mi resistono.
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_03"); //Se hai problemi, tieniteli per te. Non ne ho bisogno.
};

// ********************************************************
// 						Manieren
// ********************************************************

instance DIA_Valentino_Manieren		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 3;
	condition	= DIA_Valentino_Manieren_Condition;
	information	= DIA_Valentino_Manieren_Info;
	permanent 	= FALSE;
	description	= "Sembra proprio che dovrò insegnarti le buone maniere!";
};

func int DIA_Valentino_Manieren_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Valentino_HALLO))
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Valentino_Manieren_Info ()
{
	AI_Output (other, self, "DIA_Valentino_Add_15_02"); //Sembra proprio che dovrò insegnarti le buone maniere!
	//AI_Output			(other, self, "DIA_Valentino_HALLO_klappe_15_00"); //Für deine dünnen Ärmchen hast du 'ne ganz schön große Klappe!
	AI_Output			(self, other, "DIA_Valentino_HALLO_klappe_03_01"); //Non è affar mio! Picchiami quanto vuoi, quando mi alzerò domani, starò di nuovo bene.
	AI_Output			(self, other, "DIA_Valentino_HALLO_klappe_03_02"); //Ma tu dovrai andare in giro con quella faccia da imbecille per tutta la vita.
};

///////////////////////////////////////////////////////////////////////
//	Info Wasnuetzliches
///////////////////////////////////////////////////////////////////////

var int Valentino_Lo_Perm;
var int Valentino_Hi_Perm;
//---------------------------------------------------

instance DIA_Valentino_WASNUETZLICHES		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 4;
	condition	= DIA_Valentino_WASNUETZLICHES_Condition;
	information	= DIA_Valentino_WASNUETZLICHES_Info;
	permanent	= TRUE;
	description	= "C’è qualcos’altro che devi dirmi?";
};

func int DIA_Valentino_WASNUETZLICHES_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Valentino_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Valentino_WASNUETZLICHES_Info ()
{
	AI_Output (other, self, "DIA_Valentino_Add_15_03"); //(con calma) Hai qualcos'altro da dirmi?
	//AI_Output			(other, self, "DIA_Valentino_WASNUETZLICHES_15_00"); //Kannst du mir was Nützliches über die Stadt erzählen?
	
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		B_Say (self, other, "$NOTNOW");
	}
	else if (Valentino_Lo_Perm == FALSE)
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_01"); //Diventa popolare, non promettere mai niente a nessuno, prendi quello che puoi e stai attento a non litigare con i militari.
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_02"); //Oppure con mariti gelosi. Sono peggio, te l'assicuro.
		Valentino_Lo_Perm = TRUE;
	}
	else if (Valentino_Hi_Perm == FALSE)
	&& ( (other.guild == GIL_PAL) || (other.guild == GIL_KDF) )
	{
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_03"); //Per un uomo nella tua posizione, tutto è possibile. Devi solo semplicemente riconoscere il momento adatto per agire.
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_04"); //Perciò, non perdere altro tempo e agisci.
		Valentino_Hi_Perm = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Valentino_WASNUETZLICHES_03_05"); //Ti ho detto tutto ciò di che volevi sapere, il resto spetta a te.
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Valentino_PICKPOCKET (C_INFO)
{
	npc			= VLK_421_Valentino;
	nr			= 900;
	condition	= DIA_Valentino_PICKPOCKET_Condition;
	information	= DIA_Valentino_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Sarebbe facile sottrargli la chiave)";
};                       

FUNC INT DIA_Valentino_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_Valentino) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Valentino_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Valentino_PICKPOCKET);
	Info_AddChoice		(DIA_Valentino_PICKPOCKET, DIALOG_BACK 		,DIA_Valentino_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Valentino_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Valentino_PICKPOCKET_DoIt);
};

func void DIA_Valentino_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems (self, other, ItKe_Valentino, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Valentino_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); 
	};
};
	
func void DIA_Valentino_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Valentino_PICKPOCKET);
};




