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
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_00");//Посмотрите, кто пришел. 
	if (C_BodyStateContains(self, BS_SIT))
	{
		NPC_StopAni (self,"T_PRAY_RANDOM");
		AI_PlayAniBS (self, "T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNpc (self,	other);
	};
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_01");//Повелитель предупредил меня, что Иннос пошлет своего слугу.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_02");//Но я не думал, что ты придешь так быстро.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_03");//Что ж, раз ты так спешил, (смеется) то и смерть твоя будет быстрой.
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Ты прав, один из нас умрет. И это будешь ты!",DIA_Addon_Raven_Hi_DU);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Ты продал душу Белиару!",DIA_Addon_Raven_Hi_Soul);
};
FUNC VOID DIA_Addon_Raven_Hi_DU()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_00");//Ты прав, один из нас умрет. И это будешь ты!
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_04");//(смеется) Тебе со мной не справиться. У меня меч Белиара.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_05");//Я поведу армию драконов на континент. Вместе мы погрузим мир людей в вечную тьму!
};
FUNC VOID DIA_Addon_Raven_Hi_Soul()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_01");//Ты продал душу Белиару!
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_06");//Да, и за хорошую цену. Я стану генералом его армий.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_07");//А как насчет тебя? Тебе известно, сколько стоит ТВОЯ душа?
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Достаточно. Приступим к делу...",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Я лишь делаю то, что должно быть исполнено.",DIA_Addon_Raven_Hi_only);

};
FUNC VOID DIA_Addon_Raven_Hi_only()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_02");//Я лишь делаю то, что должно быть исполнено.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_08");//(смеется) Вы только послушайте! Ты прислал мне покорного раба, Иннос!
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Достаточно. Приступим к делу...",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Ты уверен, что я служу Инносу?",DIA_Addon_Raven_Hi_Sure);	
};
FUNC VOID DIA_Addon_Raven_Hi_Sure()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_03");//Ты уверен, что я служу Инносу? 
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_09");//Что? О чем ты говоришь?
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_04");//Ты не думал, что я могу быть и исполнителем воли Аданоса?
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_10");//(смеется) Чепуха!
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_05");//А может, я тоже служу Белиару? Или лишь самому себе? 
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_11");//(усмехается) Что ж, в таком случае ты мне даже не  противник!
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Достаточно. Приступим к делу...",DIA_Addon_Raven_Hi_Attack);
};
FUNC VOID DIA_Addon_Raven_Hi_Attack()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_06");//Достаточно. Приступим к делу...
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_12");//(усмехается) Ты так торопишься умереть? Ну, раз ты настаиваешь...
	
	AI_StopProcessInfos	(self); 
	B_Attack (self, other, AR_SuddenEnemyInferno,1);
};
/*
--------------
10 *NEU* DIA_Addon_Raven_Add_10_00 //Seht wer gekommen ist. 
10 *NEU* DIA_Addon_Raven_Add_10_01 //Mein Meister hat mich davor gewarnt, daЯ Innos seine Schergen schicken wьrde.
10 *NEU* DIA_Addon_Raven_Add_10_02 //Aber das du so frьh auftauchst, hдtte ich nicht erwartet.
10 *NEU* DIA_Addon_Raven_Add_10_03 //Nun, da du so schnell warst (lacht) werde ich dir auch einen schnellen Tod schenken.
--------------
15 *NEU* DIA_Addon_Raven_Add_15_00 //DU bist derjenige der sterben wird.
10 *NEU* DIA_Addon_Raven_Add_10_04 //(lacht) Du bist keine Bedrohung fьr mich. Ich trage Beliars Schwert.
10 *NEU* DIA_Addon_Raven_Add_10_05 //Ich werde die Drachen auf's Festland fьhren. Zusammen werden wir die Welt der Menschen in tiefste Dunkelheit tauchen.
--------------
15 *NEU* DIA_Addon_Raven_Add_15_01 //Du hast deine Seele an Beliar verkauft!
10 *NEU* DIA_Addon_Raven_Add_10_06 //Zu einem guten Preis. Als General werde ich seine Armeen befehligen.
10 *NEU* DIA_Addon_Raven_Add_10_07 //Und was ist mit dir? WeiЯt du wieviel DEINE Seele wert ist?
--------------
15 *NEU* DIA_Addon_Raven_Add_15_02 //Ich mache nur das, was getan werden muss.
10 *NEU* DIA_Addon_Raven_Add_10_08 //(lacht) Hцrt ihn euch an. Einen bescheidenen Diener schickst du mir Innos! (Lacht laut)
--------------
15 *NEU* DIA_Addon_Raven_Add_15_03 //Bist du sicher, dass ich ein Diener Innos bin? 
10 *NEU* DIA_Addon_Raven_Add_10_09 //Was? Was redest du da?
15 *NEU* DIA_Addon_Raven_Add_15_04 //Hдltst du es nicht fьr mцglich das ich ein Diener Adanos bin?
10 *NEU* DIA_Addon_Raven_Add_10_10 //(lacht) Unsinn!
15 *NEU* DIA_Addon_Raven_Add_15_05 //Vielleicht diene auch ICH Beliar - oder nur mir selbst. 
10 *NEU* DIA_Addon_Raven_Add_10_11 //(hцhnt) Nun, in diesem Fall wirst du nicht einmal ein wьrdiger Gegner fьr mich sein!
--------------
15 *NEU* DIA_Addon_Raven_Add_15_06 //Mir reichts jetzt. Lass uns anfangen...
10 *NEU* DIA_Addon_Raven_Add_10_12 //(hцhnt) Hast du es so eilig zu sterben? Ganz, wie du willst...
--------------

*/




 

