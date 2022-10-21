// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Richter_EXIT(C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 999;
	condition	= DIA_Richter_EXIT_Condition;
	information	= DIA_Richter_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Richter_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Richter_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hello 
// ************************************************************

INSTANCE DIA_Richter_Hello(C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 4;
	condition	= DIA_Richter_Hello_Condition;
	information	= DIA_Richter_Hello_Info;
	permanent	= FALSE;
	description = "Cosa stai facendo, qui?";
};                       

FUNC INT DIA_Richter_Hello_Condition()
{
	if (MIS_Lee_JudgeRichter == 0)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Richter_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Richter_Hello_15_00"); //Cosa stai facendo qui?
	AI_Output (self ,other,"DIA_Richter_Hello_10_01"); //Cosa vuoi da me? Chi sei?
	AI_Output (other,self ,"DIA_Richter_Hello_15_02"); //Io, ehm...
	AI_Output (self ,other,"DIA_Richter_Hello_10_03"); //Dimmi, non ti ho già visto da qualche parte?
	
	Info_ClearChoices (DIA_Richter_Hello);
	Info_AddChoice (DIA_Richter_Hello,"Non che io ricordi.",DIA_Richter_Hello_DontThinkSo);
	Info_AddChoice (DIA_Richter_Hello,"Forse sì.",DIA_Richter_Hello_MayBe);
};

FUNC VOID DIA_Richter_Hello_DontThinkSo ()
{
	AI_Output (other,self ,"DIA_Richter_Hello_DontThinkSo_15_00"); //Non che io ricordi.
	AI_Output (self ,other,"DIA_Richter_Hello_DontThinkSo_10_01"); //È strano. Potrei giurare di averti già incontrato.
	AI_Output (self ,other,"DIA_Richter_Hello_DontThinkSo_10_02"); //Non importa, sei ovviamente un'inutile feccia. Vi assomigliate tutti.
};

FUNC VOID DIA_Richter_Hello_MayBe ()
{
	AI_Output (other,self ,"DIA_Richter_Hello_MayBe_15_00"); //Forse sì.
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_01"); //Non essere sfacciato! Con chi credi di parlare?
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_02"); //Il minimo che tu possa fare è rivolgerti a me con un tono più rispettoso.
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_03"); //E ora sparisci dalla mia vista!
	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Perm 
// ************************************************************

INSTANCE DIA_Richter_Perm(C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 800;
	condition	= DIA_Richter_Perm_Condition;
	information	= DIA_Richter_Perm_Info;
	permanent	= TRUE;
	description = "Cosa succede?";
};                       

FUNC INT DIA_Richter_Perm_Condition()
{
	if ((Npc_KnowsInfo (other,DIA_Richter_Hello)) || (MIS_Lee_JudgeRichter == LOG_RUNNING))
	&& (SCIstRichtersLakai == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_Perm_Info()
{	
	AI_Output (other,self ,"DIA_Richter_Perm_15_00"); //Come va?

	if (MIS_Lee_JudgeRichter == LOG_RUNNING)
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG ))
	{
		AI_Output (self ,other,"DIA_Richter_Perm_10_01"); //Faresti meglio a sparire, sporco mercenario, prima che io chiami le guardie.
		AI_Output (other,self ,"DIA_Richter_Perm_15_02"); //Rilassati, non sono qui per rubarti qualcosa. Sto cercando del lavoro.
		AI_Output (self ,other,"DIA_Richter_Perm_10_03"); //Ah, dunque vorresti lavorare per me. Mmmh, questa allora è un'altra storia.
		AI_Output (self ,other,"DIA_Richter_Perm_10_04"); //C'è, ahimè, un piccolo problema. Non so se posso fidarmi di te o meno. Dovrai dimostrarmi la tue lealtà prima.
		SCIstRichtersLakai = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Richter_Perm_10_05"); //Non ti ho chiaramente detto che non voglio avere a che fare nulla con te?
		AI_Output (other,self ,"DIA_Richter_Perm_15_06"); //No, non in tutte quelle parole.
		AI_Output (self ,other,"DIA_Richter_Perm_10_07"); //Allora spero che tu abbia finalmente colto il punto.
	};
};

// ************************************************************
// 			  				   RichtersLakai 
// ************************************************************

INSTANCE DIA_Richter_RichtersLakai (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_RichtersLakai_Condition;
	information	= DIA_Richter_RichtersLakai_Info;

	description = "Sottoponimi alla prova.";
};                       

FUNC INT DIA_Richter_RichtersLakai_Condition()
{
	if ((Npc_KnowsInfo (other,DIA_Richter_Hello)) || (MIS_Lee_JudgeRichter != 0))
	&& (SCIstRichtersLakai == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_RichtersLakai_Info()
{	
	AI_Output (other,self ,"DIA_Richter_RichtersLakai_15_00"); //Sottoponimi alla prova.
	AI_Output (self ,other,"DIA_Richter_RichtersLakai_10_01"); //Mmmh, d'accordo. Ascolta. Portami il sacro martello dei Maghi del Fuoco. Lo custodiscono da qualche parte nei sotterranei del loro monastero.
	AI_Output (self ,other,"DIA_Richter_RichtersLakai_10_02"); //Se ci riuscirai, potrei pensare di assumerti come guardia del corpo.
	
	Info_ClearChoices	(DIA_Richter_RichtersLakai);
	Info_AddChoice	(DIA_Richter_RichtersLakai, "Dovrei derubare i maghi? Devi essere fuori di testa.", DIA_Richter_RichtersLakai_nein );
	Info_AddChoice	(DIA_Richter_RichtersLakai, "Va bene.", DIA_Richter_RichtersLakai_ja );
	
	B_LogEntry (TOPIC_RichterLakai,"Il giudice non mi crede. Devo prima provare la mia fedeltà verso di lui. Devo rubare il martello consacrato dai sotterranei del monastero dei Maghi del Fuoco e portarglielo."); 

	MIS_Richter_BringHolyHammer = LOG_RUNNING;
};
func void DIA_Richter_RichtersLakai_nein ()
{
	AI_Output			(other, self, "DIA_Richter_RichtersLakai_nein_15_00"); //Dovrei derubare i maghi? Devi essere fuori di testa.
	AI_Output			(self, other, "DIA_Richter_RichtersLakai_nein_10_01"); //Allora vai all'inferno e smettila di farmi perdere tempo.
	AI_StopProcessInfos (self);
};

func void DIA_Richter_RichtersLakai_ja ()
{
	AI_Output			(other, self, "DIA_Richter_RichtersLakai_ja_15_00"); //Va bene.
	AI_Output			(self, other, "DIA_Richter_RichtersLakai_ja_10_01"); //Bene. Ma ricorda: se ti prendono, io non ho mai sentito parlare di te.
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				   KillMorgahard 
// ************************************************************

INSTANCE DIA_Richter_KillMorgahard (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_KillMorgahard_Condition;
	information	= DIA_Richter_KillMorgahard_Info;

	description =	"Ecco il martello consacrato dei maghi.";
};                       

FUNC INT DIA_Richter_KillMorgahard_Condition()
{
	if (Npc_HasItems (other,Holy_Hammer_MIS))
	&& (MIS_Richter_BringHolyHammer == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_KillMorgahard_Info()
{	
	AI_Output (other,self ,"DIA_Richter_KillMorgahard_15_00"); //Ecco il sacro martello dei maghi.
	B_GiveInvItems (other, self, Holy_Hammer_MIS,1);
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_01"); //Sono veramente impressionato. Dunque sei serio a riguardo, vero? Ecco la tua paga.
	CreateInvItems (self, ItMi_Gold, 300);									
	B_GiveInvItems (self, other, ItMi_Gold, 300);					
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_02"); //Bene, se le cose stanno così, ho già un altro lavoretto per te.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_03"); //Alcuni giorni fa dei prigionieri sono fuggiti dalla prigione locale.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_04"); //Quegli infami si sono diretti verso le montagne. Da qualche parte in direzione della nuova torre di Xardas.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_05"); //Il nome del loro capo è Morgahard. Voglio che tu lo uccida.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_06"); //Sbrigati prima che spariscano per sempre.
	
	Wld_InsertNpc	(BDT_1030_Morgahard,"REICH"); 
	Wld_InsertNpc	(BDT_1031_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1032_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1033_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1034_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1035_Fluechtling,"REICH"); 

	B_InitNpcGlobals ();

	B_GivePlayerXP (XP_BringHolyHammer);
	MIS_Richter_BringHolyHammer = LOG_SUCCESS;
	B_LogEntry (TOPIC_RichterLakai,"Alcuni prigionieri sono sfuggiti al giudice. Dovrò rintracciarli e uccidere il loro capo, Morgahard. Si stanno probabilmente nascondendo tra le montagne, da qualche parte verso la nuova torre di Xardas."); 
	MIS_Richter_KillMorgahard = LOG_RUNNING;
	AI_StopProcessInfos (self);
};	

// ************************************************************
// 	  KilledMorgahard 
// ************************************************************

INSTANCE DIA_Richter_KilledMorgahard (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_KilledMorgahard_Condition;
	information	= DIA_Richter_KilledMorgahard_Info;

	description =	"Morgahard è morto.";
};                       

FUNC INT DIA_Richter_KilledMorgahard_Condition()
{
	if (Npc_IsDead(Morgahard))
	&& (MIS_Richter_KillMorgahard == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_KilledMorgahard_Info()
{	
	AI_Output (other,self ,"DIA_Richter_KilledMorgahard_15_00"); //Morgahard è morto.
	AI_Output (self ,other,"DIA_Richter_KilledMorgahard_10_01"); //Ah, sei un bravo ragazzo. Ecco la tua ricompensa.
	CreateInvItems (self, ItMi_Gold, 400);									
	B_GiveInvItems (self, other, ItMi_Gold, 400);					
	B_GivePlayerXP (XP_KillMorgahard);
	B_LogEntry (TOPIC_RichterLakai,"Il giudice era visibilmente sorpreso dalla notizia della morte di Morgahard. Oh beh, lasciamo stare. Non devo perdere di vista il compito affidatomi da Lee."); 
	MIS_Richter_KillMorgahard = LOG_SUCCESS;
};

// ************************************************************
// 	  KilledMorgahardPERM 
// ************************************************************

INSTANCE DIA_Richter_KilledMorgahardPERM (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_KilledMorgahardPERM_Condition;
	information	= DIA_Richter_KilledMorgahardPERM_Info;
	permanent	 = 	TRUE;

	description =	"Posso fare qualcos’altro per te?";
};                       

FUNC INT DIA_Richter_KilledMorgahardPERM_Condition()
{
	if (MIS_Richter_KillMorgahard == LOG_SUCCESS)
	&& (MIS_RichtersPermissionForShip == 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_KilledMorgahardPERM_Info ()
{	
	AI_Output (other,self ,"DIA_Richter_KilledMorgahardPERM_15_00"); //Posso fare qualcos’altro per te?
	AI_Output (self ,other,"DIA_Richter_KilledMorgahardPERM_10_01"); //Al momento no, forse più tardi.
};

// ************************************************************
// 		 PermissionForShip 
// ************************************************************

INSTANCE DIA_Richter_PermissionForShip (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_PermissionForShip_Condition;
	information	= DIA_Richter_PermissionForShip_Info;

	description =	"Preparami un’autorizzazione scritta per la nave dei paladini.";
};                       

FUNC INT DIA_Richter_PermissionForShip_Condition()
{
	if (MIS_RichtersPermissionForShip == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_PermissionForShip_Info ()
{	
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_00"); //Dammi un’autorizzazione scritta per la nave dei paladini.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_01"); //(ride) Devi essere uscito di testa. Cosa vuoi che faccia?
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_02"); //Mi hai sentito bene. Dammi quell'autorizzazione, oppure ti consegnerò all'esercito.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_03"); //(tuonando) Non mi farò ricattare. E di certo non da te! Ti darò in pasto ai lupi, miserabile rifiuto.
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_04"); //Morgahard ha assalito il governatore per ordine tuo. Sono in possesso di un documento lo dimostra.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_05"); //(grida) Arrh.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_06"); //Te ne pentirai. Nessuno può ricattarmi e uscirne vivo.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_07"); //Ecco la tua autorizzazione. Ora vattene, mi occuperò di te più tardi.
	CreateInvItems (self,ItWr_ForgedShipLetter_Mis,1);
	B_GiveInvItems (self,other,ItWr_ForgedShipLetter_Mis,1);
	B_LogEntry (TOPIC_Ship,"La lettera di autorizzazione renderà un gioco da ragazzi ottenere la nave. Mi chiedo cosa dirà Lee."); 
	MIS_RichtersPermissionForShip = LOG_SUCCESS;
	B_GivePlayerXP (XP_RichtersPermissionForShip);
};

// ************************************************************
// 		 perm2 
// ************************************************************

INSTANCE DIA_Richter_perm2 (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_perm2_Condition;
	information	= DIA_Richter_perm2_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};                       

FUNC INT DIA_Richter_perm2_Condition()
{
	if (MIS_RichtersPermissionForShip == LOG_SUCCESS)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

FUNC VOID DIA_Richter_perm2_Info ()
{	
	AI_Output (self ,other,"DIA_Richter_perm2_10_00"); //Sparisci dalla mia vista.
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Richter_PICKPOCKET (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 900;
	condition	= DIA_Richter_PICKPOCKET_Condition;
	information	= DIA_Richter_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Sarebbe facile sottrargli la chiave)";
};                       

FUNC INT DIA_Richter_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_Richter) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Richter_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Richter_PICKPOCKET);
	Info_AddChoice		(DIA_Richter_PICKPOCKET, DIALOG_BACK 		,DIA_Richter_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Richter_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Richter_PICKPOCKET_DoIt);
};

func void DIA_Richter_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems (self, other, ItKe_Richter, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();	
		Info_ClearChoices (DIA_Richter_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); 
	};
};
	
func void DIA_Richter_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Richter_PICKPOCKET);
};




