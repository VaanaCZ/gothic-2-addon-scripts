///////////////////////////////////////////////////////////////////////
//	Info B_DIA_Addon_Myxir_TeachRequest
///////////////////////////////////////////////////////////////////////
func void B_DIA_Addon_Myxir_TeachRequest ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TeachRequest_15_00"); //Nauč mę tomu jazyku.
}; 

func void B_DIA_Addon_Myxir_TeachL1 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_00"); //Začneme od nejjednoduššího. Nejdâív tę tedy naučím jazyku rolníků.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_01"); //Základním pravidlem písemných záznamů rolníků je, že se zabývají svętskými záležitostmi, jako je práce, láska nebo získávání potravy.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_02"); //Býval to bęžný jazyk ve męstech. Pokud jej znáš, dokážeš pochopit vętšinu zdejších textů.
};

func void B_DIA_Addon_Myxir_TeachL2 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_00"); //Jazykem rolníků už vládneš, ale jazyk válečníků je o nęco obtížnęjší.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_01"); //Texty v tomto jazyce se vętšinou týkají zbraní a válčení. I ty by ses z jejich záznamů mohl lecčemus pâiučit.
};

func void B_DIA_Addon_Myxir_TeachL3 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_00"); //Vytâíbený jazyk knęží je skutečnę obtížné pochopit, ale rád ti s tím pomohu.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_01"); //Je to jazyk posvátných textů, které pojednávají o historii a o magii stvoâitelů.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_02"); //Každý z tęchto textů je skutečným pokladem, když víš, co znamená.
};

func void B_DIA_Addon_Myxir_TeachNoMore ()
{
	AI_Output 	(self, other,"DIA_Addon_Myxir_TeachNoMore_12_00"); //Víc už tę naučit nemohu. Jazyk stavitelů jsi už plnę zvládl.
};

func void B_DIA_Addon_Myxir_Teach_LANGUAGE_X ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00"); //Bęž si vyzkoušet své nové znalosti. Uvidíš, že jazyk stavitelů už ti nebude tak nepochopitelnou záhadou.
};



