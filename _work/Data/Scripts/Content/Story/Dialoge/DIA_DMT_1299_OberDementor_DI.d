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
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_00"); //Tak, ty slizk� �erve, opov�il ses p�ij�t a� p�ed br�nu samotn�ho P�na!
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_01"); //To ty tady tah� za prov�zky?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_02"); //Jsem str�cem Irdorathsk�ch s�n�, mocn�ho zdroje Beliarovy s�ly na zemi. Bo�sk� P�nova moc pulzuje nyn� m�ma rukama.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_03"); //Sta�� mi jedin� slovo k tomu, abych t� uvrhl do v��n�ho ��lenstv�.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_04"); //Aha. H�d�m, �e se budu muset zbavit dal��ho prost�edn�ka.
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"Jsem u posledn� br�ny. Kl��em k n� bude nejsp� �ern� m�g."); 

	Info_ClearChoices	(DIA_Schwarzmagier_HELLO);
	
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Zave� m� ke sv�mu p�novi.", DIA_Schwarzmagier_HELLO_meister );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Kolik tob� podobn�ch budu je�t� muset zab�t?", DIA_Schwarzmagier_HELLO_dmt );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Co je tam za t�m velk�m port�lem?", DIA_Schwarzmagier_HELLO_hinterTor );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Kdo je tv�j p�n?", DIA_Schwarzmagier_HELLO_wer );

	if (SC_KnowsMadPsi == TRUE)
	{
		Info_AddChoice	(DIA_Schwarzmagier_HELLO, "B�val jsi Sp��ov�m n�sledovn�kem.", DIA_Schwarzmagier_HELLO_schlaefer );
	};
};
func void DIA_Schwarzmagier_HELLO_wer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_00"); //Kdo je tv�j p�n?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_01"); //Je to poutn�k mezi sv�ty. Jeho bo�sk� moudrost n�m p�in�� pozn�n�.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_02"); //Je Beliarov�m vyvolen�m, kter� zemi zbav� b�dn�ch Innosov�ch n�sledovn�k�.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_03"); //V�em, kte�� pochybuj� o jeho velkoleposti, p�in�� smrt.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_04"); //To zn� pov�dom�.

};

func void DIA_Schwarzmagier_HELLO_hinterTor ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_hinterTor_15_00"); //Co je tam za t�m velk�m port�lem?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_hinterTor_09_01"); //(sm�ch) Komnaty m�ho p�na ti z�stanou zapov�zeny. K otev�en� t� br�ny ti neposkytnu ��dnou p��le�itost.

};
func void DIA_Schwarzmagier_HELLO_schlaefer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_schlaefer_15_00"); //B�val jsi Sp��ov�m n�sledovn�kem.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_01"); //To u� je d�vno. P�n n�m otev�el o�i. Te� u� n�s nikdo nezastav�.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_02"); //P�n n�m uk�zal jedinou mo�nou cestu, jak se vypo��dat s v�mi nev���c�mi.

	TOPIC_END_DEMENTOREN = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Schwarzmagier_HELLO_dmt ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_00"); //Kolik tob� podobn�ch budu je�t� muset zab�t?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_01"); //Je n�s hodn�. Nem� ani pon�t�, kolik je t�ch, co �ekali na tuto chv�li svobody.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_02"); //B�dn� k�ik se ���� celou zem�, kdy� vstupujeme do tohoto sv�ta.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_03"); //Osvobod�me sv�t od barbar�, co si ��kaj� str�ci ohn�. Na�e shrom�d�n� tady v chr�mu u� nebude trvat dlouho.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_04"); //Ano.
};

func void DIA_Schwarzmagier_HELLO_meister ()
{
	Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_INCOVATION_RED",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("SFX_Circle",  self, self, 0, 0, 0, FALSE );
	AI_PlayAni (self,"T_PRACTICEMAGIC5");	
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_00"); //(teatr�ln�) Dost u� t�ch bl�bol�! Zni��m t�.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_01"); //Tv�j zrak t� opust� a tv� du�e zmiz� v temnot�ch.

	if (Npc_HasItems (other,ItAm_Prot_BlackEye_Mis))
	{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_meister_15_02"); //(pro sebe) Bez toho amuletu na vyvol�v�n� du�� to te� asi bude trochu probl�m.
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



