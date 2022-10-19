///////////////////////////////////////////////////////////////////////
//	Info hello
///////////////////////////////////////////////////////////////////////
instance DIA_Schwarzmagier_HELLO		(C_INFO)
{
	npc		 = 	DMT_1299_OberDementor_DI;
	nr		 = 	5;
	condition	 = 	DIA_Schwarzmagier_HELLO_Condition;
	information	 = 	DIA_Schwarzmagier_HELLO_Info;
	important	 = 	TRUE;
};

func int DIA_Schwarzmagier_HELLO_Condition ()
{
	return TRUE;
};
var int SC_KnowsMadPsi;		
func void DIA_Schwarzmagier_HELLO_Info ()
{
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_00"); //Du schleimiger Wurm wagst es also tatsächlich, bis vor die Tore des Meisters zu treten.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_01"); //Bist du hier der Drahtzieher?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_02"); //Ich bin der Wächter der Hallen von Irdorath. Die mächtigste Quelle Beliars Macht auf Erden. Durch meine Hände fließt die göttliche Kraft des Meisters.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_03"); //Nur ein Wort von mir und du wirst auf ewig dem Wahnsinn verfallen.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_04"); //Verstehe. Noch so ein Unterhändler, den ich aus dem Weg räumen muss.
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"Ich stehe vor dem letzten Tor. Dieser Schwarzmagier scheint der Schlüssel dazu zu sein."); 

	Info_ClearChoices	(DIA_Schwarzmagier_HELLO);
	
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Bring mich zu deinem Meister.", DIA_Schwarzmagier_HELLO_meister );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Wieviel von eurer Sorte muß ich denn noch töten?", DIA_Schwarzmagier_HELLO_dmt );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Was verbirgt sich dort hinter dem großen Tor?", DIA_Schwarzmagier_HELLO_hinterTor );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Wer ist dein Meister?", DIA_Schwarzmagier_HELLO_wer );

	if (SC_KnowsMadPsi == TRUE)
	{
		Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Du warst einmal ein Anhänger des Schläfers.", DIA_Schwarzmagier_HELLO_schlaefer );
	};
};
func void DIA_Schwarzmagier_HELLO_wer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_00"); //Wer ist dein Meister?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_01"); //Er ist ein Wanderer zwischen den Welten. Seine göttliche Weisheit erleuchtet uns.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_02"); //Er ist der Erwählte Beliars, das Reich von den elenden Innos-Anhängern zu befreien.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_03"); //Er bringt allen den Tod, die an seiner Herrlichkeit zweifeln.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_04"); //Kommt mir bekannt vor.

};

func void DIA_Schwarzmagier_HELLO_hinterTor ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_hinterTor_15_00"); //Was verbirgt sich dort hinter dem großen Tor?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_hinterTor_09_01"); //(lacht) Die Gemächer meines Herren bleiben unerreichbar für dich. Ich werde dir keine Gelegenheit geben, das Tor zu öffnen.

};
func void DIA_Schwarzmagier_HELLO_schlaefer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_schlaefer_15_00"); //Du warst einmal ein Anhänger des Schläfers.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_01"); //Das ist graue Vergangenheit. Der Meister hat uns die Augen geöffnet. Jetzt wird uns niemand mehr aufhalten.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_02"); //Der Meister hat uns den einzig gangbaren Weg gezeigt, mit euch Ungläubigen fertig zu werden.

	TOPIC_END_DEMENTOREN = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Schwarzmagier_HELLO_dmt ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_00"); //Wie viel von eurer Sorte muss ich denn noch töten?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_01"); //Der unsrigen sind viele. Du hast ja keine Ahnung, wie zahlreich wir schon auf diese Zeit der Befreiung warten.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_02"); //Ein Strom von Klageschreien wird sich über das Land ergießen, wenn wir in die Welt hinausziehen.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_03"); //Um die Welt von den Barbaren, die sich selbst die Hüter des Feuers nennen, zu befreien. Unsere Zusammenkunft hier im Tempel wird nicht von großer Dauer sein.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_04"); //Ja.
};

func void DIA_Schwarzmagier_HELLO_meister ()
{
	Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_INCOVATION_RED",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("SFX_Circle",  self, self, 0, 0, 0, FALSE );
	AI_PlayAni (self,"T_PRACTICEMAGIC5");	
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_00"); //(bedrohlich) Schluss mit dem Gefasel! Ich werde dich vernichten.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_01"); //Dein Augenlicht wird schwinden und dein Geist wird in der Dunkelheit vergehen.

	if (Npc_HasItems (other,ItAm_Prot_BlackEye_Mis))
	{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_meister_15_02"); //(zu sich) Ohne das Seelenruf-Amulett hätte ich jetzt ein ernstes Problem.
	}
	else
	{
		hero.attribute[ATR_MANA] = 0;
		
		if (hero.attribute[ATR_HITPOINTS] > 50)
			{
				hero.attribute[ATR_HITPOINTS] = ((hero.attribute[ATR_HITPOINTS])/2);
			};
		
		SC_ObsessionCounter = 100;
		B_SCIsObsessed (hero);
	};

	Info_ClearChoices	(DIA_Schwarzmagier_HELLO);
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, DIALOG_ENDE, DIA_Schwarzmagier_HELLO_back );

};

func void DIA_Schwarzmagier_HELLO_back ()
{
	AI_StopProcessInfos (self);
	Wld_StopEffect("DEMENTOR_FX");
	self.flags = 0;
	Snd_Play 	("MFX_FEAR_CAST" );
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
};



