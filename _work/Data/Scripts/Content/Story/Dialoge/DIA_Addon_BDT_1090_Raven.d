// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Raven_EXIT (C_INFO)
{
	npc			= BDT_1090_Addon_Raven;
	nr			= 999;
	condition	= DIA_Addon_Raven_EXIT_Condition;
	information	= DIA_Addon_Raven_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
FUNC INT DIA_Addon_Raven_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Addon_Raven_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 				  	
// ************************************************************
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Raven_Hi (C_INFO)
{
	npc			= BDT_1090_Addon_Raven;
	nr			= 1;
	condition	= DIA_Addon_Raven_Hi_Condition;
	information	= DIA_Addon_Raven_Hi_Info;
	permanent	= FALSE;
	important	= TRUE;
};        
FUNC INT DIA_Addon_Raven_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Raven_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_00");//Seht wer gekommen ist. 
	if (C_BodyStateContains(self, BS_SIT))
	{
		NPC_StopAni (self,"T_PRAY_RANDOM");
		AI_PlayAniBS (self, "T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNpc (self,	other);
	};
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_01");//Mein Meister hat mich davor gewarnt, daß Innos seine Schergen schicken würde.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_02");//Aber das du so früh auftauchst, hätte ich nicht erwartet.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_03");//Nun, da du so schnell warst (lacht) werde ich dir auch einen schnellen Tod schenken.
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"DU bist derjenige der sterben wird.",DIA_Addon_Raven_Hi_DU);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Du hast deine Seele an Beliar verkauft!",DIA_Addon_Raven_Hi_Soul);
};
FUNC VOID DIA_Addon_Raven_Hi_DU()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_00");//DU bist derjenige der sterben wird.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_04");//(lacht) Du bist keine Bedrohung für mich. Ich trage Beliars Schwert.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_05");//Ich werde die Drachen auf's Festland führen. Zusammen werden wir die Welt der Menschen in tiefste Dunkelheit tauchen.
};
FUNC VOID DIA_Addon_Raven_Hi_Soul()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_01");//Du hast deine Seele an Beliar verkauft!
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_06");//Zu einem guten Preis. Als General werde ich seine Armeen befehligen.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_07");//Und was ist mit dir? Weißt du wieviel DEINE Seele wert ist?
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Mir reichts jetzt. Lass uns anfangen...",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Ich mache nur das, was getan werden muss.",DIA_Addon_Raven_Hi_only);

};
FUNC VOID DIA_Addon_Raven_Hi_only()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_02");//Ich mache nur das, was getan werden muss.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_08");//(lacht) Hört ihn euch an. Einen bescheidenen Diener schickst du mir Innos! (Lacht laut)
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Mir reichts jetzt. Lass uns anfangen...",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Bist du sicher, dass ich ein Diener Innos bin?",DIA_Addon_Raven_Hi_Sure);	
};
FUNC VOID DIA_Addon_Raven_Hi_Sure()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_03");//Bist du sicher, dass ich ein Diener Innos bin? 
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_09");//Was? Was redest du da?
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_04");//Hältst du es nicht für möglich das ich ein Diener Adanos bin?
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_10");//(lacht) Unsinn!
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_05");//Vielleicht diene auch ICH Beliar - oder nur mir selbst. 
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_11");//(höhnt) Nun, in diesem Fall wirst du nicht einmal ein würdiger Gegner für mich sein!
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Mir reichts jetzt. Lass uns anfangen...",DIA_Addon_Raven_Hi_Attack);
};
FUNC VOID DIA_Addon_Raven_Hi_Attack()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_06");//Mir reichts jetzt. Lass uns anfangen...
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_12");//(höhnt) Hast du es so eilig zu sterben? Ganz, wie du willst...
	
	AI_StopProcessInfos	(self); 
	B_Attack (self, other, AR_SuddenEnemyInferno,1);
};
/*
--------------
10 *NEU* DIA_Addon_Raven_Add_10_00 //Seht wer gekommen ist. 
10 *NEU* DIA_Addon_Raven_Add_10_01 //Mein Meister hat mich davor gewarnt, daß Innos seine Schergen schicken würde.
10 *NEU* DIA_Addon_Raven_Add_10_02 //Aber das du so früh auftauchst, hätte ich nicht erwartet.
10 *NEU* DIA_Addon_Raven_Add_10_03 //Nun, da du so schnell warst (lacht) werde ich dir auch einen schnellen Tod schenken.
--------------
15 *NEU* DIA_Addon_Raven_Add_15_00 //DU bist derjenige der sterben wird.
10 *NEU* DIA_Addon_Raven_Add_10_04 //(lacht) Du bist keine Bedrohung für mich. Ich trage Beliars Schwert.
10 *NEU* DIA_Addon_Raven_Add_10_05 //Ich werde die Drachen auf's Festland führen. Zusammen werden wir die Welt der Menschen in tiefste Dunkelheit tauchen.
--------------
15 *NEU* DIA_Addon_Raven_Add_15_01 //Du hast deine Seele an Beliar verkauft!
10 *NEU* DIA_Addon_Raven_Add_10_06 //Zu einem guten Preis. Als General werde ich seine Armeen befehligen.
10 *NEU* DIA_Addon_Raven_Add_10_07 //Und was ist mit dir? Weißt du wieviel DEINE Seele wert ist?
--------------
15 *NEU* DIA_Addon_Raven_Add_15_02 //Ich mache nur das, was getan werden muss.
10 *NEU* DIA_Addon_Raven_Add_10_08 //(lacht) Hört ihn euch an. Einen bescheidenen Diener schickst du mir Innos! (Lacht laut)
--------------
15 *NEU* DIA_Addon_Raven_Add_15_03 //Bist du sicher, dass ich ein Diener Innos bin? 
10 *NEU* DIA_Addon_Raven_Add_10_09 //Was? Was redest du da?
15 *NEU* DIA_Addon_Raven_Add_15_04 //Hältst du es nicht für möglich das ich ein Diener Adanos bin?
10 *NEU* DIA_Addon_Raven_Add_10_10 //(lacht) Unsinn!
15 *NEU* DIA_Addon_Raven_Add_15_05 //Vielleicht diene auch ICH Beliar - oder nur mir selbst. 
10 *NEU* DIA_Addon_Raven_Add_10_11 //(höhnt) Nun, in diesem Fall wirst du nicht einmal ein würdiger Gegner für mich sein!
--------------
15 *NEU* DIA_Addon_Raven_Add_15_06 //Mir reichts jetzt. Lass uns anfangen...
10 *NEU* DIA_Addon_Raven_Add_10_12 //(höhnt) Hast du es so eilig zu sterben? Ganz, wie du willst...
--------------

*/




 

