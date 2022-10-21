// -------------------------------------------------------------------------
// Nicos Satz
// -------------------------------------------------------------------------
func void B_Dragon_Undead_Bla()
{
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_00"); //Beh, ragazzo? Hai dunque una versione originale?
};

// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Undead_Exit(C_INFO)
{
	
	npc 		= Dragon_Undead;
	nr			= 999;
	condition	= DIA_Dragon_Undead_Exit_Condition;
	information	= DIA_Dragon_Undead_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Undead_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Undead_Exit_Info()
{	
	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Undead_Hello(C_INFO)
{
	
	npc 		= Dragon_Undead;
	nr			= 5;
	condition	= DIA_Dragon_Undead_Hello_Condition;
	information	= DIA_Dragon_Undead_Hello_Info;

	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Undead_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Dragon_Undead_Hello_Info()
{	
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_00"); //Dunque sei riuscito a trovarmi. Ho atteso troppo a lungo il tuo arrivo.
	AI_Output (other, self, "DIA_Dragon_Undead_Hello_15_01"); //Coraggio. Smettila di far finta che avevi previsto ogni cosa.
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_02"); //(ride sonoramente) Cosa sai delle mie intenzioni?
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_03"); //Non ho forse inviato i miei Cercatori per attirarti sulle mie tracce?
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_04"); //Non ho forse lasciato i segni della mia esistenza cos� in vista da condurti inevitabilmente a me?

	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_05"); //E le uova di drago non hanno forse contribuito alla tua armatura aiutandoti a raggiungermi?
	};

	if (hero.guild == GIL_PAL)
	{	
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_06"); //I paladini convertiti non erano forse un motivo sufficiente per ricercare chi li avesse indotti a tradire?
	};

	if (hero.guild == GIL_KDF)
	{	
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_07"); //Gli esseri della tua specie posseduti non erano forse un motivo sufficiente per ricercare il responsabile?
	};

	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_08"); //Per quanto tu ci giri intorno e ti dibatta, non puoi negare tutto questo.
	
	//ADDON
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_01"); //C'� solo una cosa che non era prevista! 
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_02"); //Hai eliminato uno dei miei servitori! Era stato scelto per portare l'artiglio.
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_03"); //Da quello che vedo, ora lo porti tu. Per questo oltraggio, morirai!
	
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Basta chiacchiere.", DIA_Dragon_Undead_Hello_attack );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "In nome di chi stai conducendo i tuoi servi alla guerra contro il genere umano?", DIA_Dragon_Undead_Hello_Auftraggeber );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Perch� sei qui?", DIA_Dragon_Undead_Hello_warum );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Chi sei?", DIA_Dragon_Undead_Hello_wer );

	B_LogEntry (TOPIC_HallenVonIrdorath,"Il nemico � un drago non morto. Dovr� ucciderlo prima di lasciare questa dannata isola."); 
};
func void DIA_Dragon_Undead_Hello_wer ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_wer_15_00"); //Chi sei?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_01"); //(ride) Non l'hai ancora capito? Cerca la risposta dentro di te, sciocco. Tu mi conosci.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_02"); //Io non ho un nome. Cos� come te.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_03"); //Ho ricevuto il potere divino dal mio creatore, cos� come tu porti il potere del tuo dio dentro di te.

	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_04"); //Il mio destino � distruggere il mondo.
	
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_05"); //Cos� come il tuo destino � determinato dall'integrit� e dalla virt� di un paladino.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_06"); //Cos� come la tua mano � portatrice di morte, Cacciatore di Draghi.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_07"); //Cos� come il tuo scopo � predicare la fede di Innos, Mago del Fuoco.
		};

	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_08"); //Non avverti il legame che ci unisce? S�, tu sai perfettamente chi sono.
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_wer_15_09"); //(confuso) No. Non pu� essere. Xardas diceva sempre...
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_10"); //Xardas � debole e non rappresenta un pericolo per me. Tu solo sei degno di essere al mio cospetto.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_11"); //Cos� � scritto. � arrivato il momento di accettare il tuo destino.
	
	

};

func void DIA_Dragon_Undead_Hello_warum ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_warum_15_00"); //Perch� sei qui?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_warum_20_01"); //La divinit� che mi � stata concessa mi spinger� a far affondare il mondo in un fiume di violenza.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_warum_20_02"); //Solo quando anche l'ultima fortezza dei virtuosi sar� caduta potr� riposarmi.

};

func void DIA_Dragon_Undead_Hello_Auftraggeber ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_Auftraggeber_15_00"); //Per nome di chi stai conducendo i tuoi servi verso la guerra contro il genere umano?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_01"); //Il mio padrone � il Signore della Notte. Tu lo conosci. Puoi avvertire il suo richiamo.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_03"); //I miei eserciti risorgeranno dalla terra nel suo nome e avvolgeranno il mondo nelle tenebre.
};

func void DIA_Dragon_Undead_Hello_attack ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_attack_15_00"); //Basta cos�. Ti ricaccer� sotto la roccia dalla quale sei strisciato fuori, mostro.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_attack_20_01"); //(ride) Non sei pronto per battermi. Mi basta un attimo e avr� raggiunto il mio obiettivo.
	//ADDON
	if (C_ScHasEquippedBeliarsWeapon())
	|| (C_ScHasReadiedBeliarsWeapon())
	|| (C_ScHasBeliarsRune())
	{
		AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_04"); //Credi davvero di potermi ferire con l'artiglio? (ride)
	};
	//ADDON ENDE
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_attack_20_02"); //Le tue ossa mi serviranno per fare in modo che i venti di morte spazzino il mondo.
		
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 
	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};





