require 'spec_helper'

module Docxtor2
  describe ContentBuilder do
    include XPathMatchers

    context 'with table_of_contents DSL instruction' do
      context 'table of contents' do
        let(:xml) { ContentBuilder.build { toc! } }

        it 'should contain paragraph id' do
          xml.should exist_xpath('//w:sdt/w:sdtPr/w:id')
        end

        it 'should contain gallery of document parts' do
          xml.should exist_xpath('//w:sdt/w:sdtPr/w:docPartObj/w:docPartGallery')
        end

        it 'should contain TOCHeading style' do
          xml.should exist_xpath('//w:sdt/w:sdtContent/w:p/w:pPr/w:pStyle')
        end

        it 'should contain heading text' do
          xml.should exist_xpath('//w:sdt/w:sdtContent/w:p/w:r/w:t')
        end
      end

      it 'should contain paragraph' do
        ContentBuilder.build {
          p 'Paragraph'
        }.should exist_xpath('//w:p/w:r/w:t')
      end

      it 'should contain h1'
      it 'should contain h2'
    end
  end
end
