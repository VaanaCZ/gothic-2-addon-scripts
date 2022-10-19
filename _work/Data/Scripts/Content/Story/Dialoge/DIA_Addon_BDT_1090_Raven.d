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
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_00");//Regardez qui voil�... 
	if (C_BodyStateContains(self, BS_SIT))
	{
		NPC_StopAni (self,"T_PRAY_RANDOM");
		AI_PlayAniBS (self, "T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNpc (self,	other);
	};
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_01");//Mon ma�tre m'avait bien pr�venu qu'Innos enverrait ses sous-fifres...
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_02");//Mais je ne pensais pas que vous vous montreriez ici aussi rapidement.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_03");//Dans ce cas, pour vous f�liciter de votre rapidit�... (rires) je vous accorderai une mort rapide !
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"C'est VOUS qui allez mourir.",DIA_Addon_Raven_Hi_DU);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Vous avez vendu votre �me � Beliar !",DIA_Addon_Raven_Hi_Soul);
};
FUNC VOID DIA_Addon_Raven_Hi_DU()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_00");//C'est VOUS qui allez mourir.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_04");//(rires) Vous ne repr�sentez aucun risque � mes yeux... Je porte l'�p�e de Beliar !
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_05");//Je m�nerai les dragons vers le continent ! Ensemble, nous plongerons le monde des humains dans les t�n�bres infinies !
};
FUNC VOID DIA_Addon_Raven_Hi_Soul()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_01");//Vous avez vendu votre �me � Beliar !
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_06");//A bon prix. Il a fait de moi le g�n�ral qui commandera ses arm�es.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_07");//Et vous ? Savez-vous seulement ce que vaut VOTRE �me ?
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Assez parl�, maintenant. Commen�ons...",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Je me contente d'ex�cuter ce qui doit �tre accompli.",DIA_Addon_Raven_Hi_only);

};
FUNC VOID DIA_Addon_Raven_Hi_only()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_02");//Je me contente d'ex�cuter ce qui doit �tre accompli.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_08");//(rires) Ecoutez-le donc... TU m'envoies un bien humble serviteur, Innos ! (rires retentissants)
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Assez parl�, maintenant. Commen�ons...",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Etes-vous certain que je suis un serviteur d'Innos ?",DIA_Addon_Raven_Hi_Sure);	
};
FUNC VOID DIA_Addon_Raven_Hi_Sure()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_03");//Etes-vous certain que je suis un serviteur d'Innos ? 
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_09");//Quoi ? Que dites-vous ?
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_04");//Ne pensez-vous pas que je puisse �tre un serviteur d'Adanos ?
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_10");//(Rires) Balivernes !
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_05");//Peut-�tre sers-je Beliar, moi aussi - ou peut-�tre me sers-je moi-m�me. 
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_11");//(m�prisant) Dans ce cas, vous n'�tes m�me pas digne d'�tre mon adversaire !
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Assez parl�, maintenant. Commen�ons...",DIA_Addon_Raven_Hi_Attack);
};
FUNC VOID DIA_Addon_Raven_Hi_Attack()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_06");//Assez parl�, maintenant. Commen�ons...
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_12");//(m�prisant) Ainsi, vous �tes press� de mourir... Eh bien, puisque vous insistez...
	
	AI_StopProcessInfos	(self); 
	B_Attack (self, other, AR_SuddenEnemyInferno,1);
};
/*
--------------
10 *NEU* DIA_Addon_Raven_Add_10_00 //Seht wer gekommen ist. 
10 *NEU* DIA_Addon_Raven_Add_10_01 //Mein Meister hat mich davor gewarnt, da� Innos seine Schergen schicken w�rde.
10 *NEU* DIA_Addon_Raven_Add_10_02 //Aber das du so fr�h auftauchst, h�tte ich nicht erwartet.
10 *NEU* DIA_Addon_Raven_Add_10_03 //Nun, da du so schnell warst (lacht) werde ich dir auch einen schnellen Tod schenken.
--------------
15 *NEU* DIA_Addon_Raven_Add_15_00 //DU bist derjenige der sterben wird.
10 *NEU* DIA_Addon_Raven_Add_10_04 //(lacht) Du bist keine Bedrohung f�r mich. Ich trage Beliars Schwert.
10 *NEU* DIA_Addon_Raven_Add_10_05 //Ich werde die Drachen auf's Festland f�hren. Zusammen werden wir die Welt der Menschen in tiefste Dunkelheit tauchen.
--------------
15 *NEU* DIA_Addon_Raven_Add_15_01 //Du hast deine Seele an Beliar verkauft!
10 *NEU* DIA_Addon_Raven_Add_10_06 //Zu einem guten Preis. Als General werde ich seine Armeen befehligen.
10 *NEU* DIA_Addon_Raven_Add_10_07 //Und was ist mit dir? Wei�t du wieviel DEINE Seele wert ist?
--------------
15 *NEU* DIA_Addon_Raven_Add_15_02 //Ich mache nur das, was getan werden muss.
10 *NEU* DIA_Addon_Raven_Add_10_08 //(lacht) H�rt ihn euch an. Einen bescheidenen Diener schickst du mir Innos! (Lacht laut)
--------------
15 *NEU* DIA_Addon_Raven_Add_15_03 //Bist du sicher, dass ich ein Diener Innos bin? 
10 *NEU* DIA_Addon_Raven_Add_10_09 //Was? Was redest du da?
15 *NEU* DIA_Addon_Raven_Add_15_04 //H�ltst du es nicht f�r m�glich das ich ein Diener Adanos bin?
10 *NEU* DIA_Addon_Raven_Add_10_10 //(lacht) Unsinn!
15 *NEU* DIA_Addon_Raven_Add_15_05 //Vielleicht diene auch ICH Beliar - oder nur mir selbst. 
10 *NEU* DIA_Addon_Raven_Add_10_11 //(h�hnt) Nun, in diesem Fall wirst du nicht einmal ein w�rdiger Gegner f�r mich sein!
--------------
15 *NEU* DIA_Addon_Raven_Add_15_06 //Mir reichts jetzt. Lass uns anfangen...
10 *NEU* DIA_Addon_Raven_Add_10_12 //(h�hnt) Hast du es so eilig zu sterben? Ganz, wie du willst...
--------------

*/




 

