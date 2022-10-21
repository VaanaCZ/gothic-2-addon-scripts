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
	description = "Was machst du hier?";
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
	AI_Output (other,self ,"DIA_Richter_Hello_15_00"); //Was machst du hier?
	AI_Output (self ,other,"DIA_Richter_Hello_10_01"); //Was sprichst du mich an? Wer bist du überhaupt.
	AI_Output (other,self ,"DIA_Richter_Hello_15_02"); //Ich, äh ...
	AI_Output (self ,other,"DIA_Richter_Hello_10_03"); //Sag mal, kenn ich dich nicht irgendwoher?
	
	Info_ClearChoices (DIA_Richter_Hello);
	Info_AddChoice (DIA_Richter_Hello,"Ich kann mich nicht daran erinnern.",DIA_Richter_Hello_DontThinkSo);
	Info_AddChoice (DIA_Richter_Hello,"Kann schon sein.",DIA_Richter_Hello_MayBe);
};

FUNC VOID DIA_Richter_Hello_DontThinkSo ()
{
	AI_Output (other,self ,"DIA_Richter_Hello_DontThinkSo_15_00"); //Ich kann mich nicht daran erinnern.
	AI_Output (self ,other,"DIA_Richter_Hello_DontThinkSo_10_01"); //Komisch, ich hätte schwören können, dass ich dir schon mal begegnet bin.
	AI_Output (self ,other,"DIA_Richter_Hello_DontThinkSo_10_02"); //Macht ja nichts, man sieht dir eh an, dass du aus der Gosse kommst. Ihr seht irgendwie alle gleich aus.
};

FUNC VOID DIA_Richter_Hello_MayBe ()
{
	AI_Output (other,self ,"DIA_Richter_Hello_MayBe_15_00"); //Kann schon sein.
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_01"); //Nicht so patzig! Was glaubst du eigentlich, mit wem du redest?
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_02"); //Schlag mir gegenüber wenigstens einen angemessenen Ton an.
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_03"); //Und jetzt geh mir aus den Augen!
	
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
	description = "Wie sieht's aus?";
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
	AI_Output (other,self ,"DIA_Richter_Perm_15_00"); //Wie sieht's aus?

	if (MIS_Lee_JudgeRichter == LOG_RUNNING)
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG ))
	{
		AI_Output (self ,other,"DIA_Richter_Perm_10_01"); //Du dreckiger Söldner machst gefälligst, dass du verschwindest, bevor ich die Wachen rufe.
		AI_Output (other,self ,"DIA_Richter_Perm_15_02"); //Langsam. Ich bin nicht hier, um dich zu bestehlen. Ich suche Arbeit.
		AI_Output (self ,other,"DIA_Richter_Perm_10_03"); //So. Du willst also für mich arbeiten. Mmh. Das ist natürlich etwas anderes.
		AI_Output (self ,other,"DIA_Richter_Perm_10_04"); //Da gibt es leider nur ein kleines Problem. Ich weiß nicht, ob ich dir vertrauen kann. Du wirst deine Loyalität erst beweisen müssen.
		SCIstRichtersLakai = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Richter_Perm_10_05"); //Habe ich dir nicht klar gemacht, dass ich keinen Kontakt mit dir wünsche?
		AI_Output (other,self ,"DIA_Richter_Perm_15_06"); //Nun, nicht direkt.
		AI_Output (self ,other,"DIA_Richter_Perm_10_07"); //Dann hast du mich jetzt hoffentlich verstanden.
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

	description = "Stell mich auf die Probe.";
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
	AI_Output (other,self ,"DIA_Richter_RichtersLakai_15_00"); //Stell mich auf die Probe.
	AI_Output (self ,other,"DIA_Richter_RichtersLakai_10_01"); //Mmh. Na gut. Hör zu. Bring mir den heiligen Hammer der Magier des Feuers. Sie bewahren ihn irgendwo im Keller des Klosters auf.
	AI_Output (self ,other,"DIA_Richter_RichtersLakai_10_02"); //Wenn du das schaffst, dann werde ich darüber nachdenken, dich bei mir als Leibgarde anzustellen.
	
	Info_ClearChoices	(DIA_Richter_RichtersLakai);
	Info_AddChoice	(DIA_Richter_RichtersLakai, "Ich soll die Magier beklauen?  Du hast sie doch nicht alle.", DIA_Richter_RichtersLakai_nein );
	Info_AddChoice	(DIA_Richter_RichtersLakai, "Alles klar.", DIA_Richter_RichtersLakai_ja );
	
	B_LogEntry (TOPIC_RichterLakai,"Der Richter traut mir nicht. Ich muß erst meine Loyalität ihm gegenüber unter Beweis stellen. Ich soll den heiligen Hammer aus dem Keller des Feuermagierklosters stehlen und ihn zum Richter bringen."); 

	MIS_Richter_BringHolyHammer = LOG_RUNNING;
};
func void DIA_Richter_RichtersLakai_nein ()
{
	AI_Output			(other, self, "DIA_Richter_RichtersLakai_nein_15_00"); //Ich soll die Magier beklauen? Du hast sie doch nicht alle.
	AI_Output			(self, other, "DIA_Richter_RichtersLakai_nein_10_01"); //Dann geh zum Teufel und verschwende nicht meine Zeit.
	AI_StopProcessInfos (self);
};

func void DIA_Richter_RichtersLakai_ja ()
{
	AI_Output			(other, self, "DIA_Richter_RichtersLakai_ja_15_00"); //Alles klar.
	AI_Output			(self, other, "DIA_Richter_RichtersLakai_ja_10_01"); //Gut. Aber denk daran, wenn sie dich erwischen, habe ich nie von dir gehört.
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

	description =	"Hier ist der heilige Hammer der Magier.";
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
	AI_Output (other,self ,"DIA_Richter_KillMorgahard_15_00"); //Hier ist der heilige Hammer der Magier.
	B_GiveInvItems (other, self, Holy_Hammer_MIS,1);
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_01"); //Ich bin schwer beeindruckt. Dir scheint es ja tatsächlich ernst damit zu sein, was? Hier ist dein Lohn.
	CreateInvItems (self, ItMi_Gold, 300);									
	B_GiveInvItems (self, other, ItMi_Gold, 300);					
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_02"); //Gut. Wenn das so ist, habe ich auch schon den nächsten Auftrag für dich.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_03"); //Vor einigen Tagen sind mehrere Gefangene aus dem hiesigen Gefängnis geflohen.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_04"); //Die Hundesöhne haben sich in die Berge verdrückt. Irgendwo in Richtung Xardas neuen Turm.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_05"); //Der Name ihres Anführers ist Morgahard. Ich will, dass du ihn tötest.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_06"); //Geh und beeile dich, bevor sie über alle Berge sind.
	
	Wld_InsertNpc	(BDT_1030_Morgahard,"REICH"); 
	Wld_InsertNpc	(BDT_1031_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1032_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1033_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1034_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1035_Fluechtling,"REICH"); 

	B_InitNpcGlobals ();

	B_GivePlayerXP (XP_BringHolyHammer);
	MIS_Richter_BringHolyHammer = LOG_SUCCESS;
	B_LogEntry (TOPIC_RichterLakai,"Dem Richter sind einige Gefangene weg gelaufen. Ich soll sie für ihn wieder einfangen und ihren Anführer MORGAHARD töten. Sie sollen sich in die Berge verdrückt haben. Irgendwo in Richtung Xardas neuen Turm."); 
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

	description =	"Morgahard ist tot.";
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
	AI_Output (other,self ,"DIA_Richter_KilledMorgahard_15_00"); //Morgahard ist tot.
	AI_Output (self ,other,"DIA_Richter_KilledMorgahard_10_01"); //Ah. Du bist ein guter Junge. Hier ist deine Belohnung.
	CreateInvItems (self, ItMi_Gold, 400);									
	B_GiveInvItems (self, other, ItMi_Gold, 400);					
	B_GivePlayerXP (XP_KillMorgahard);
	B_LogEntry (TOPIC_RichterLakai,"Die Nachricht über Morgahards Tod hat den Richter sichtlich amüsiert. Soll er ruhig. Ich darf Lees Auftrag nicht aus dem Auge verlieren."); 
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

	description =	"Gibt es sonst noch etwas, was ich für dich erledigen kann?";
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
	AI_Output (other,self ,"DIA_Richter_KilledMorgahardPERM_15_00"); //Gibt es sonst noch etwas, was ich für dich erledigen kann?
	AI_Output (self ,other,"DIA_Richter_KilledMorgahardPERM_10_01"); //Im Moment nicht. Vielleicht später.
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

	description =	"Gib mir eine Ermächtigung für das Schiff der Paladine.";
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
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_00"); //Gib mir eine Ermächtigung für das Schiff der Paladine.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_01"); //(Lacht) Du bist ja wohl nicht ganz bei Trost. Was soll ich tun?
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_02"); //Du hast mich schon verstanden. Gib mir die Ermächtigung oder ich werde dich der Miliz melden.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_03"); //(Brüllt) Ich lasse mich nicht erpressen. Schon gar nicht von dir. Ich werde dich den Wölfen zum Fraß vorwerfen, du Stück Dreck.
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_04"); //Morgahard hat in deinem Auftrag den Statthalter überfallen. Ich besitze ein Schriftstück, das es beweisen kann.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_05"); //(Brüllt) Arrh.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_06"); //Das wird dir noch Leid tun. Mich erpresst man nicht ungestraft.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_07"); //Hier hast du die Ermächtigung. Nun geh. Ich werde später mit dir abrechnen.
	CreateInvItems (self,ItWr_ForgedShipLetter_Mis,1);
	B_GiveInvItems (self,other,ItWr_ForgedShipLetter_Mis,1);
	B_LogEntry (TOPIC_Ship,"Mit dem Ermächtigungsschreiben des Richters sollte es für mich kein Problem mehr sein, das Schiff in meinen Besitz zu bringen. Was Lee wohl dazu sagen wird?"); 
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
	AI_Output (self ,other,"DIA_Richter_perm2_10_00"); //Geh mir aus den Augen.
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
	description = "(Es wäre einfach seinen Schlüssel zu stehlen)";
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




